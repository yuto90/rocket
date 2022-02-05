import 'package:flutter/material.dart';

class Building extends StatelessWidget {
  final heightSize;
  final widthSize;
  Building({this.heightSize, this.widthSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/rocket.png'),
        //fit: BoxFit.cover,
        height: 90,
        width: 90,
      ),
    );
  }
}
