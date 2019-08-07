import 'package:flutter/material.dart';
import 'package:city_picker/city_picker.dart';
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
        _getCityId(result?.province, result?.city, result?.county);

    widget.onCityChange(selectedCity.areaid);

    print("${result?.province} - ${result?.city} - ${result?.county}");
    setState(() {
      cityName = selectedCity.countyname;
    });
  }

  City _getCityId(String province, String city, String county) {
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
        City provinceRes =
            cityList.firstWhere((_) => province.indexOf(_.countyname) == 0);
        return provinceRes;
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
        onTap: _showCityPicker, //点击
      ),
    );
  }
}
