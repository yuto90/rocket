import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/star.png'),
        fit: BoxFit.cover,
        height: 40,
        width: 40,
      ),
    );
  }
}
