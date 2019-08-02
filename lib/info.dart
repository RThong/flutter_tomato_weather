import 'package:flutter/material.dart';
import 'package:flutter_study/models/weather.dart';
import 'dart:math' as math;

import 'utils/helper.dart';

// class WeatherInfo {
//   String value;
// }
// String temp;
class WeatherNow {
  final String img; // 天气图片
  final String temp; // 温度
  final String wS; // 风级
  final String weather; // 天气
  final String aqi; // 空气质量指数
  final String quality; //空气质量
  final String temp_day_c; // 最高气温
  final String temp_night_c; // 最低气温

  WeatherNow(
      {this.img,
      this.temp,
      this.wS,
      this.weather,
      this.aqi,
      this.quality,
      this.temp_day_c,
      this.temp_night_c});
}

class Info extends StatelessWidget {
  // WeatherInfo info;

  WeatherNow info;
  Info({this.info}) {
    print('Info');
  }

  Widget build(BuildContext context) {
    // 如果外部没有props传入说明没有获取到数据就返回一个空的container
    return this.info == null
        ? Container(width: 0, height: 0)
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[_weatherInfoLeft(), _weatherInfoRight()],
          );
  }

  _weatherInfoLeft() {
    return Container(
      height: 150,
      width: 110,
      // color: Color.fromRGBO(255, 255, 255, .5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 80,
            alignment: Alignment.center,
            child: Text('${this.info.temp}°',
                style: TextStyle(
                    color: textColor,
                    fontSize: 60.0,
                    shadows: [
                      Shadow(color: Colors.grey, offset: Offset(0.5, 0.5))
                    ],
                    decoration: TextDecoration.none)),
          ),
          Container(
            height: 20,
            alignment: Alignment.center,
            child: Text('${this.info.temp_night_c}°/${this.info.temp_day_c}°',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: new Icon(
                  IconData(0xe614, fontFamily: "ShuyeIcon"),
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
              Text('${this.info.aqi}${this.info.quality}',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w100,
                      fontSize: 12))
            ],
          )
        ],
      ),
    );
  }

  _weatherInfoRight() {
    return Container(
      height: 150,
      width: 110,
      // color: Color.fromRGBO(255, 255, 255, .5),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 80,
              child: Image.asset(
                'images/${this.info.img}.png',
                width: 50,
                height: 50,
              )),
          Container(
            height: 20,
            alignment: Alignment.center,
            child: Text(this.info.weather,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: AnimationWidget(
                    animationChild: new Icon(
                  IconData(0xe615, fontFamily: "FengcheIcon"),
                  size: 16.0,
                  color: Color.fromRGBO(255, 255, 255, 1),
                )),
              ),
              Text(this.info.wS,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w100,
                      decoration: TextDecoration.none)),
            ],
          )
        ],
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  static final _rotateTween = new Tween<double>(begin: 0.0, end: math.pi * 2);

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Transform.rotate(
                angle: _rotateTween.evaluate(animation), child: child),
            child: child),
      );
}

class AnimationWidget extends StatefulWidget {
  Widget animationChild;
  AnimationWidget({this.animationChild});
  _AppState createState() => _AppState();
}

class _AppState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    // animation = Tween<double>(begin: 0.0, end: math.pi * 2).animate(controller);
    // animation =
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
    controller.forward();
  }
  // #enddocregion print-state

  @override
  Widget build(BuildContext context) => GrowTransition(
        child: widget.animationChild,
        animation: animation,
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  // #docregion print-state
}
