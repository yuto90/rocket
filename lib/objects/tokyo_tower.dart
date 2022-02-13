import 'package:flutter/material.dart';

class TokyoTower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/tokyo_tower.png'),
        fit: BoxFit.cover,
        height: 200,
        width: 90,
      ),
    );
  }
}
