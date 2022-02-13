import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocket/display_mode.dart';
import 'mainpage_model.dart';
import 'objects/goal.dart';
import 'objects/boy.dart';
import 'objects/star.dart';
import 'objects/ufo.dart';
import 'objects/rocket.dart';
import 'objects/cloud.dart';
import 'size_config.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widgetサイズ最適化用クラスを初期化
    SizeConfig().init(context);
    return ChangeNotifierProvider<MainPageModel>(
      create: (_) => MainPageModel(),
      child: Consumer<MainPageModel>(
        builder: (context, model, child) {
          return GestureDetector(
            onTap: () {
              if (model.gameHasStarted) {
                model.move();
              } else if (model.display == 'ready') {
                model.startGame(context);
              }
            },
            child: Scaffold(
              body: Stack(
                children: [
                  // * 空背景 ----------------------------------------------------------
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    height: model.space,
                    color: Colors.blueGrey[800],
                  ),
                  // * 地面 ----------------------------------------------------------
                  AnimatedContainer(
                    alignment: Alignment(0, model.ground),
                    duration: Duration(milliseconds: 0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.brown,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(model.boy, -1),
                            child: Boy(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // * ゴール -----------------------------------------------------------
                  AnimatedContainer(
                    alignment: Alignment(0, model.goal),
                    duration: Duration(microseconds: 0),
                    child: Goal(heightSize: 20, widthSize: 20),
                  ),
                  // * ロケット ---------------------------------------------------------
                  AnimatedContainer(
                    // ロケットの初期位置
                    alignment: Alignment(0, model.rocketYaxis),
                    duration: Duration(milliseconds: 0),
                    child: MyRocket(),
                  ),
                  // * 障害物 -----------------------------------------------------------
                  AnimatedContainer(
                    alignment: Alignment(model.ufo_1, -1),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(model.ufo_075, -0.75),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(model.ufo_05, -0.5),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(model.ufo_025, -0.25),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(model.ufo0, 0),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(model.ufo025, 0.25),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(model.ufo05, 0.5),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(model.ufo075, 0.75),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(model.ufo1, 1),
                    duration: Duration(microseconds: 0),
                    child: Ufo(),
                  ),
                  // * 雲背景 -----------------------------------------------------------
                  AnimatedContainer(
                    alignment: Alignment(1, model.back3),
                    duration: Duration(microseconds: 0),
                    child: Cloud(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(-1, model.back2),
                    duration: Duration(microseconds: 0),
                    child: Cloud(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(1, model.back),
                    duration: Duration(microseconds: 0),
                    child: Cloud(),
                  ),
                  // * 星 -----------------------------------------------------------
                  AnimatedContainer(
                    alignment: Alignment((model.star3 * -1), model.star3),
                    duration: Duration(microseconds: 0),
                    child: Star(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment((model.star2 * -1), model.star2),
                    duration: Duration(microseconds: 0),
                    child: Star(),
                  ),
                  AnimatedContainer(
                    alignment: Alignment((model.star * -1), model.star),
                    duration: Duration(microseconds: 0),
                    child: Star(),
                  ),

                  // * 各モード画面
                  DisplayMode(model: model),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
