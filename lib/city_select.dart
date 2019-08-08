import 'package:flutter/material.dart';
import 'package:city_picker/city_picker.dart';
import 'package:amap_location/amap_location.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'utils/city.dart';

class CitySelect extends StatefulWidget {
  final Function(num areaid) onCityChange;

  CitySelect({this.onCityChange});

  @override
  _CitySelectState createState() => _CitySelectState();
}

class _CitySelectState extends State<CitySelect> {
  String cityName = '123';

  void _showCityPicker() async {
    CityResult result = await showCityPicker(context, initCity: CityResult());

    if (result == null) {
      return;
    }

    City selectedCity =
        _getCity(result?.province, result?.city, result?.county);

    widget.onCityChange(selectedCity.areaid);

    print("${result?.province} - ${result?.city} - ${result?.county}");
    setState(() {
      cityName = selectedCity.countyname;
    });
  }

  String getLocationStr(AMapLocation loc) {
    if (loc == null) {
      return "正在定位";
    }

    if (loc.isSuccess()) {
      if (loc.hasAddress()) {
        return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n 区:${loc.district} 城市:${loc.city} 省:${loc.province}";
      } else {
        return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
      }
    } else {
      return "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
    }
  }

  /**
   * 获取定位权限
   */
  void _checkPersmission() async {
    bool hasPermission =
        await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult =
          await SimplePermissions.requestPermission(
              Permission.WhenInUseLocation);
      if (requestPermissionResult == PermissionStatus.denied) {
        Alert(context: context, title: "申请定位权限失败", desc: "Flutter is awesome.")
            .show();

        return;
      }
    }
    // AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
    //   if (!mounted) return;
    //   // print(getLocationStr(loc));
    //   // print('区:${loc.district} 城市:${loc.city} 省:${loc.province}');
    //   // City a = this._getCity(loc.province, loc.city, loc.district);
    //   // print('${a.countyname}+++ ${a.areaid}');
    //   // this.location = '${a.areaid}';

    //   print('##########');
    //   // setState(() {
    //   //   this.location = getLocationStr(loc);
    //   // });
    // });

    // 直接获取定位信息
    AMapLocation loc = await AMapLocationClient.getLocation(true);
    print(loc.district);
    City res = _getCity(loc.province, loc.city, loc.district);
    if (res is City) {
      widget.onCityChange(res.areaid);
      setState(() {
        this.cityName = res.countyname;
      });
    }
  }

  // _fn() async {
  //   await AMapLocationClient.startup(new AMapLocationOption(
  //       desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
  //   AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
  //     if (!mounted) return;
  //     print('监听定位');
  //   });
  //   AMapLocationClient.startLocation();
  // }

  City _getCity(String province, String city, String county) {
    print(county);
    //查看county级匹配的城市
    List<City> countyResList =
        cityList.where((_) => county.indexOf(_.countyname) == 0).toList();
    // 县级匹配到一个
    if (countyResList.length == 1) {
      return countyResList[0];
    }
    //县级未匹配到
    else if (countyResList.length == 0) {
      List<City> cityResList =
          cityList.where((_) => city.indexOf(_.countyname) == 0).toList();
      if (cityResList.length == 0) {
        List<City> provinceResList =
            cityList.where((_) => province.indexOf(_.countyname) == 0).toList();
        // return provinceRes ? provinceRes : null;
        return provinceResList.length == 0 ? null : provinceResList[0];
      }
      return cityResList[0];
    }
    // 县级匹配到多个
    else {
      print('@@@@@@$province');
      num id;
      List<City> provinceResList =
          (cityList.where((_) => province.indexOf(_.countyname) == 0)).toList();
      if (provinceResList.length == 0) {
        List<City> cityResList =
            (cityList.where((_) => city.indexOf(_.countyname) == 0)).toList();
        id = cityResList[0].areaid;
      } else {
        id = provinceResList[0].areaid;
      }

      List<num> resArr = [];
      num key;
      countyResList.forEach((_) {
        resArr.add(_.areaid - id);
      });
      resArr.sort();
      for (var i = 0; i < resArr.length; i++) {
        if (resArr[i] > 0) {
          key = i;
          break;
        }
      }
      return countyResList[key];
    }
  }

  @override
  void initState() {
    print('city_select initstate');
    _checkPersmission();
    // AMapLocationClient.startLocation();

    // _fn();
    super.initState();
  }

  @override
  void dispose() {
    //注意这里停止监听
    AMapLocationClient.stopLocation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      // color: Color.fromRGBO(255, 255, 255, .5),
      child: GestureDetector(
        child: Text(this.cityName,
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none)),
        onTap: this._showCityPicker, //点击
      ),
    );
  }
}
