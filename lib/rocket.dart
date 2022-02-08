import 'package:flutter/material.dart';

class MyRocket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      child: Image(
        image: AssetImage('lib/images/rocket2.png'),
        fit: BoxFit.cover,
        height: 70,
        width: 45,
      ),
    );
  }
}
