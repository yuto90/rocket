import 'package:flutter/material.dart';

class Building extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/billding.png'),
        fit: BoxFit.cover,
        height: 200,
        width: 90,
      ),
    );
  }
}
