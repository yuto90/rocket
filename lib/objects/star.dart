import 'package:flutter/material.dart';
import '../size_config.dart';

class Star extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/star.png'),
        fit: BoxFit.cover,
        height: SizeConfig.blockSizeVertical * 4,
        width: SizeConfig.blockSizeVertical * 4,
      ),
    );
  }
}
