import 'package:flutter/material.dart';

class Planet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/planet.png'),
        fit: BoxFit.cover,
        height: 200,
        width: 200,
      ),
    );
  }
}
