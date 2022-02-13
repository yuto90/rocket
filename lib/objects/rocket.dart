import 'package:flutter/material.dart';
import '../size_config.dart';

class MyRocket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      child: Image(
        image: AssetImage('lib/images/rocket.png'),
        fit: BoxFit.cover,
        height: SizeConfig.blockSizeVertical * 9,
        width: SizeConfig.blockSizeHorizontal * 9,
      ),
    );
  }
}
