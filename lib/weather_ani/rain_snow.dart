import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationContainer extends StatefulWidget {
  double width;
  double height;
  AnimationContainer({this.width, this.height});
  @override
  _AnimationContainerState createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  List<RainAni> rainList = [];
  int WIDGET_COUNT = 15;
  @override
  Widget build(BuildContext context) {
    return Stack(children: this.rainList);
  }

  RainAni _createRainAni(int index) {
    return RainAni(
        width: widget.width,
        height: widget.height,
        key: ValueKey(math.Random().nextDouble()),
        onComplete: () {
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

  RainAni({this.onComplete, this.key, this.width, this.height});

  _RainAniState createState() => new _RainAniState();
}

class _RainAniState extends State<RainAni> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double test;

  initState() {
    this.test = new math.Random().nextDouble() * widget.width;
    super.initState();
    controller = new AnimationController(
        duration:
            Duration(milliseconds: new math.Random().nextInt(2000) + 3000),
        vsync: this);
    animation = new Tween(begin: -100.0, end: widget.height).animate(controller)
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
    return Positioned(
      top: animation.value,
      left: this.test,
      child: Container(
        width: .5,
        height: 20,
        color: Colors.white,
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
