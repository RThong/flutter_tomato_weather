import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      // height: 100,
      // width: MediaQuery.of(context).size.width,
      child: Image.asset('images/sunny.png', fit: BoxFit.fitWidth),
    );
  }
}
