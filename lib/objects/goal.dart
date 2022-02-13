import 'package:flutter/material.dart';
import '../size_config.dart';

class Goal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/goal.png'),
        fit: BoxFit.cover,
        height: SizeConfig.blockSizeVertical * 20,
        width: SizeConfig.blockSizeVertical * 20,
      ),
    );
  }
}
