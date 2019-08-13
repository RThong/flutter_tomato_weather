import 'package:flutter/material.dart';
import 'package:flutter_study/weather_ani/rain_snow.dart';
import 'weather_ani/cloud.dart';
import 'weather_ani/sunny.dart';

class BgAni extends StatelessWidget {
  int weatherNum;
  BgAni({this.weatherNum});
  @override
  Widget build(BuildContext context) {
    return this.weatherNum == 0
        ? Container(child: Sun())
        : this.weatherNum == 1
            ? Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Cloud(),
              )
            : this.weatherNum >= 3 && this.weatherNum <= 12
                ? Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: AnimationContainer(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  )
                : Container(width: 0, height: 0);
  }
}
