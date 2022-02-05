import 'package:flutter/material.dart';

class MyRocket extends StatelessWidget {
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
