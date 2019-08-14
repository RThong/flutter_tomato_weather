import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

enum AniMode { rain, snow }

class AnimationContainer extends StatefulWidget {
  double width;
  double height;
  AniMode aniMode;
  AnimationContainer({this.width, this.height, this.aniMode});
  @override
  _AnimationContainerState createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  List<RainAni> rainList = [];
  int WIDGET_COUNT = 10;
  bool isInit = true;
  @override
  Widget build(BuildContext context) {
    return Stack(children: this.rainList);
  }

  RainAni _createRainAni(int index) {
    return RainAni(
        width: widget.width,
        height: widget.height,
        key: ValueKey(math.Random().nextDouble()),
        isInit: this.isInit,
        aniMode: widget.aniMode,
        onComplete: () {
          this.isInit = false;
          setState(() {
            this.rainList[index] = _createRainAni(index);
          });
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.rainList = List.generate(this.WIDGET_COUNT, (i) => i)
          .map((_) => this._createRainAni(_))
          .toList();
    });
  }
}

class RainAni extends StatefulWidget {
  Key key;
  var onComplete;
  double width;
  double height;
  AniMode aniMode;

  bool
      isInit; // 判断是否是初始化的rainAni数组，初始化的高度在-400范围内随机，非初始化的高度为0，执行动画完成回调就赋值为false

  RainAni(
      {this.onComplete,
      this.key,
      this.width,
      this.height,
      this.isInit,
      this.aniMode});

  _RainAniState createState() => new _RainAniState();
}

class _RainAniState extends State<RainAni> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double left;

  initState() {
    this.left = new math.Random().nextDouble() * widget.width;
    super.initState();
    controller = new AnimationController(
        duration: Duration(seconds: new math.Random().nextInt(3) + 4),
        vsync: this);
    animation = new Tween(
            begin: widget.isInit
                ? -math.Random().nextDouble() * widget.height
                : 0.0,
            end: widget.height)
        .animate(controller)
          ..addListener(() {
            setState(() {});
          });
    animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        widget.onComplete();
      }
    });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return widget.aniMode == AniMode.rain
        ? Positioned(
            top: animation.value,
            left: this.left,
            child: Container(
              width: .5,
              height: 20,
              color: Colors.white,
            ),
          )
        : Positioned(
            top: animation.value,
            left: this.left,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white70),
            ),
          );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
