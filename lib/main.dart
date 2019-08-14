import 'package:flutter/material.dart';
import 'bg_ani.dart';
import 'chart.dart';
import 'net/api.dart';
import 'info.dart';
import 'city_select.dart';
import 'package:flutter_study/models/weather.dart';
import 'package:amap_location/amap_location.dart';

void main() {
  AMapLocationClient.setApiKey("368dcd68c54be8bbca8de0806da4b6d6");
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        //应用名称
        title: 'Flutter Demo',
        theme: new ThemeData(
          //蓝色主题
          primarySwatch: Colors.blue,
        ),
        color: Colors.blue,
        //应用首页路由
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num areaid = 101210101;

  WeatherNow nowWeatherInfo;
  List<Weather7DaysInfo> weather7daysInfo;
  // 获取全局的RefreshIndicator的key
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  bool isLoading = true;

  Future<Null> _getWeather() async {
    print('获取数据$areaid');
    var weatherJson = await getWeather(areaid: this.areaid);
    WeatherRes weather = new WeatherRes.fromJson(weatherJson);

    setState(() {
      this.isLoading = false;
      this.nowWeatherInfo = _filterNowWeather(weather);

      this.weather7daysInfo = _filterWeekWeather(weather);
    });
  }

  WeatherNow _filterNowWeather(WeatherRes res) {
    WeatherNow result = new WeatherNow(
        img: res.value[0].realtime.img,
        temp: res.value[0].realtime.temp,
        wS: res.value[0].realtime.wS,
        weather: res.value[0].realtime.weather,
        aqi: res.value[0].pm25.aqi,
        quality: res.value[0].pm25.quality,
        temp_day_c: res.value[0].weathers[0].temp_day_c,
        temp_night_c: res.value[0].weathers[0].temp_night_c);
    return result;
  }

  List<Weather7DaysInfo> _filterWeekWeather(WeatherRes res) {
    final list = res.value[0].weathers;
    list.removeAt(list.length - 1);
    return list;
  }

  Future<Null> _refresh() async {
    // 延迟1秒获取获取数据
    await Future.delayed(Duration(seconds: 1));
    this._getWeather();
  }

  @override
  void initState() {
    print('homepage');
    AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    _getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return new RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: this._refresh,
        displacement: 100,
        child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: GestureDetector(
                onVerticalDragStart: (DragStartDetails e) {
                  //打印手指按下的位置(相对于屏幕)
                  // print("用户手指按下：${e.globalPosition}");
                },
                //手指滑动时会触发此回调
                onVerticalDragUpdate: (DragUpdateDetails e) {
                  // print('正在滑动');
                },
                onVerticalDragEnd: (DragEndDetails e) {
                  // print(e.velocity);
                  //打印滑动结束时在x、y轴上的速度
                  //竖直速度大于0表示向下滑动就显示refreshIndicator，并获取数据
                  if (e.velocity.pixelsPerSecond.dy > 0) {
                    this._refreshIndicatorKey.currentState.show();
                  }
                },
                child: Stack(children: [
                  // 页面背景层
                  this.nowWeatherInfo == null
                      ? Container(
                          child: Image.asset(
                            'images/sunny_bg.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                        )
                      : int.parse(this.nowWeatherInfo?.img) >= 2
                          ? Container(
                              color: Color(0xff6f979f),
                            )
                          : Container(
                              child: Image.asset(
                                'images/sunny_bg.jpg',
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover,
                              ),
                            ),
                  //天气效果动画层
                  nowWeatherInfo == null
                      ? Container(width: 0, height: 0)
                      : BgAni(
                          weatherNum: int.parse(nowWeatherInfo.img),
                        ),
                  Positioned(
                      top: 35,
                      right: 30,
                      child: Text(
                          '${DateTime.now().hour}:${DateTime.now().minute.toString().padRight(2, '0')}更新',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w100,
                              decoration: TextDecoration.none))),
                  // 主要信息展示层
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // 顶部城市选择区域
                      CitySelect(onCityChange: (num areaid) {
                        print('change city: $areaid');
                        // 先将最新的areaid保存  再通过refresh中的setstate进行重新渲染
                        this.areaid = areaid;
                        this._refreshIndicatorKey.currentState.show();
                      }),
                      // 实时天气信息
                      Info(info: this.nowWeatherInfo),
                      // 底部天气图标
                      Container(
                        height: 220,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              child: Container(
                                  // height: MediaQuery.of(context).size.height / 2,
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: WeatherChart(
                                    weather: this.weather7daysInfo,
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: this.weather7daysInfo == null
                                    ? []
                                    : this
                                        .weather7daysInfo
                                        .map((_) => Image.asset(
                                              'images/${_.img}.png',
                                              width: 20,
                                              height: 20,
                                            ))
                                        .toList(),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                  // 通过isLoading状态来切换没有大小的container来显隐加载动画
                  this.isLoading
                      ? Container(
                          child: Image.asset(
                            'images/sunny_bg.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          width: 0,
                          height: 0,
                        )
                ]))));
  }
}
