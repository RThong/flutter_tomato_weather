import 'package:flutter/material.dart';

class Cloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child:
            // 让widget超出屏幕
            OverflowBox(
                maxWidth: 1200,
                child: CloudAnimationWidget(
                    animationChild:
                        //  需要两张图片无限滚动的效果
                        Row(
                  children: <Widget>[
                    Container(
                      width: 600,
                      height: 200,
                      child: Image.asset(
                        'images/cloud.png',
                        // width: MediaQuery.of(context).size.width,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 600,
                      height: 200,
                      child: Image.asset(
                        'images/cloud.png',
                        // width: MediaQuery.of(context).size.width,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ))));
  }
}

class CloudTransition extends StatelessWidget {
  CloudTransition({this.child, this.animation});

  static final _translateXTween = new Tween<double>(begin: 200.0, end: -400.0);

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Transform.translate(
                offset: Offset(_translateXTween.evaluate(animation), 0),
                child: child

                // ),
                ),
            child: child),
      );
}

class CloudAnimationWidget extends StatefulWidget {
  Widget animationChild;
  CloudAnimationWidget({this.animationChild});
  _AppState createState() => _AppState();
}

class _AppState extends State<CloudAnimationWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
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
  Widget build(BuildContext context) => CloudTransition(
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
