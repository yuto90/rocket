import 'package:flutter/material.dart';
import '../size_config.dart';

class Ufo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Image(
        image: AssetImage('lib/images/ufo.png'),
        fit: BoxFit.cover,
        height: SizeConfig.blockSizeVertical * 4,
        width: SizeConfig.blockSizeVertical * 4,
      ),
    );
  }
}
