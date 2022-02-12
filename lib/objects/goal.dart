import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/goal.png'),
        fit: BoxFit.cover,
        height: 300,
        width: 300,
      ),
    );
  }
}
