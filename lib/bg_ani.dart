import 'package:flutter/material.dart';
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
            : Container(width: 0, height: 0);
  }
}
