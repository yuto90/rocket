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
                  Container(
                    alignment: Alignment(0, model.ground),
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
                  Container(
                    alignment: Alignment(0, model.goal),
                    child: Goal(heightSize: 20, widthSize: 20),
                  ),
                  // * ロケット ---------------------------------------------------------
                  Container(
                    // ロケットの初期位置
                    alignment: Alignment(0, model.rocketYaxis),
                    child: MyRocket(),
                  ),
                  // * 障害物 -----------------------------------------------------------
                  Container(
                    alignment: Alignment(model.ufo_1, -1),
                    child: Ufo(),
                  ),
                  Container(
                    alignment: Alignment(model.ufo_075, -0.75),
                    child: Ufo(),
                  ),
                  Container(
                    alignment: Alignment(model.ufo_05, -0.5),
                    child: Ufo(),
                  ),
                  Container(
                    alignment: Alignment(model.ufo_025, -0.25),
                    child: Ufo(),
                  ),
                  Container(
                    alignment: Alignment(model.ufo0, 0),
                    child: Ufo(),
                  ),
                  Container(
                    alignment: Alignment(model.ufo025, 0.25),
                    child: Ufo(),
                  ),
                  Container(
                    alignment: Alignment(model.ufo05, 0.5),
                    child: Ufo(),
                  ),
                  Container(
                    alignment: Alignment(model.ufo075, 0.75),
                    child: Ufo(),
                  ),
                  Container(
                    alignment: Alignment(model.ufo1, 1),
                    child: Ufo(),
                  ),
                  // * 雲背景 -----------------------------------------------------------
                  Container(
                    alignment: Alignment(1, model.back3),
                    child: Cloud(),
                  ),
                  Container(
                    alignment: Alignment(-1, model.back2),
                    child: Cloud(),
                  ),
                  Container(
                    alignment: Alignment(1, model.back),
                    child: Cloud(),
                  ),
                  // * 星 -----------------------------------------------------------
                  Container(
                    alignment: Alignment((model.star3 * -1), model.star3),
                    child: Star(),
                  ),
                  Container(
                    alignment: Alignment((model.star2 * -1), model.star2),
                    child: Star(),
                  ),
                  Container(
                    alignment: Alignment((model.star * -1), model.star),
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
