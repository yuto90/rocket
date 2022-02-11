import 'package:flutter/material.dart';

class Ufo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/ufo.png'),
        fit: BoxFit.cover,
        height: 40,
        width: 40,
      ),
    );
  }
}
