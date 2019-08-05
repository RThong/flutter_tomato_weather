import 'dart:convert' show json;

import 'package:flutter/material.dart';
// import 'package:flutter_study/types/type.dart';
import 'chart.dart';
import 'net/api.dart';
import 'package:dio/dio.dart';

import 'info.dart';
import 'package:flutter_study/models/weather.dart';

void main() {
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
  // WeatherInfo realTimeInfo;
  WeatherNow info;
  List<Weather7DaysInfo> weather7daysInfo;
  bool isLoading = true;

  _getWeather() async {
    // WeatherRes res = await getWeather();
    var b = await getWeather();
    WeatherRes weather = new WeatherRes.fromJson(b);

    setState(() {
      this.isLoading = false;
      this.info = _filterNowWeather(weather);
      this.weather7daysInfo = _filterWeekWeather(weather);
    });
  }

  WeatherNow _filterNowWeather(WeatherRes res) {
    WeatherNow b = new WeatherNow(
        img: res.value[0].realtime.img,
        temp: res.value[0].realtime.temp,
        wS: res.value[0].realtime.wS,
        weather: res.value[0].realtime.weather,
        aqi: res.value[0].pm25.aqi,
        quality: res.value[0].pm25.quality,
        temp_day_c: res.value[0].weathers[0].temp_day_c,
        temp_night_c: res.value[0].weathers[0].temp_night_c);
    return b;
  }

  List<Weather7DaysInfo> _filterWeekWeather(WeatherRes res) {
    final list = res.value[0].weathers;
    list.removeAt(list.length - 1);
    return list;
  }

  @override
  void initState() {
    print('homepage');
    _getWeather();
    // Timer.periodic(new Duration(seconds: 1), (timer) {
    //   _getWeather();
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(children: [
          Container(
              decoration: new BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      stops: [
                    .5,
                    .8,
                    1.0
                  ],
                      colors: [
                    Color(0xFF36749d),
                    Color(0xFF5aa9b8),
                    Color(0xFF76b9b2)
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // 顶部操作栏
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    color: Color.fromRGBO(255, 255, 255, .5),
                    child: Text('杭州市',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none)),
                  ),
                  // 实时天气信息
                  Info(info: this.info),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ? Container(color: Color.fromRGBO(255, 255, 255, .5))
              : Container(
                  width: 0,
                  height: 0,
                )
        ]));
  }
}
