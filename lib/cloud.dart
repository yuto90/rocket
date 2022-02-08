import 'package:flutter/material.dart';

class Cloud extends StatelessWidget {
  final heightSize;
  final widthSize;
  Cloud({this.heightSize, this.widthSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/cloud.png'),
        fit: BoxFit.cover,
        height: 100,
        width: 200,
      ),
    );
  }
}
