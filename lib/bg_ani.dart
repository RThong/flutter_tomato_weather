import 'package:flutter/material.dart';
import 'weather_ani/cloud.dart';
import 'weather_ani/sunny.dart';

class BgAni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        //     child: Container(
        //   margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
        //   child: Cloud(),
        // )
        child: Sun());
  }
}
