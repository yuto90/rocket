import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocket/mode/game_over.dart';
import 'package:rocket/objects/building.dart';
import 'package:rocket/objects/office.dart';
import 'package:rocket/objects/tokyo_tower.dart';
import 'package:rocket/objects/wood.dart';
import 'mode/clear.dart';
import 'mode/how.dart';
import 'mainpage_model.dart';
import 'mode/ready.dart';
import 'mode/top.dart';
import 'objects/building2.dart';
import 'objects/goal.dart';
import 'objects/meteorite.dart';
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
                  Align(
                    alignment: Alignment(0.6, model.ground),
                    child: Building2(),
                  ),
                  Align(
                    alignment: Alignment(-1.3, model.ground),
                    child: Building2(),
                  ),
                  Align(
                    alignment: Alignment(-0.1, model.ground),
                    child: Office(),
                  ),
                  Align(
                    alignment: Alignment(1.2, model.ground),
                    child: Building2(),
                  ),
                  Align(
                    alignment: Alignment(1.1, model.ground),
                    child: TokyoTower(),
                  ),
                  Align(
                    alignment: Alignment(1.1, model.ground),
                    child: Wood(),
                  ),
                  Align(
                    alignment: Alignment(-0.9, model.ground),
                    child: Office(),
                  ),
                  Align(
                    alignment: Alignment(0.2, model.ground),
                    child: Building(),
                  ),
                  Align(
                    alignment: Alignment(0, model.ground),
                    child: Wood(),
                  ),
                  Align(
                    alignment: Alignment(-0.8, model.ground),
                    child: Building(),
                  ),
                  Align(
                    alignment: Alignment(-0.4, model.ground),
                    child: Building2(),
                  ),
                  // * ゴール -----------------------------------------------------------
                  Align(
                    alignment: Alignment(0, model.goal),
                    child: Goal(heightSize: 20, widthSize: 20),
                  ),
                  // * ロケット ---------------------------------------------------------
                  Align(
                    // ロケットの初期位置
                    alignment: Alignment(0, model.rocketYaxis),
                    child: MyRocket(),
                  ),
                  // * 障害物 -----------------------------------------------------------
                  Align(
                    alignment: Alignment(model.ufo_1, -1),
                    child: Ufo(),
                  ),
                  Align(
                    alignment: Alignment(model.ufo_075, -0.75),
                    child: Ufo(),
                  ),
                  Align(
                    alignment: Alignment(model.ufo_05, -0.5),
                    child: Ufo(),
                  ),
                  Align(
                    alignment: Alignment(model.ufo_025, -0.25),
                    child: Ufo(),
                  ),
                  Align(
                    alignment: Alignment(model.ufo0, 0),
                    child: Ufo(),
                  ),
                  Align(
                    alignment: Alignment(model.ufo025, 0.25),
                    child: Ufo(),
                  ),
                  Align(
                    alignment: Alignment(model.ufo05, 0.5),
                    child: Ufo(),
                  ),
                  Align(
                    alignment: Alignment(model.ufo075, 0.75),
                    child: Ufo(),
                  ),
                  Align(
                    alignment: Alignment(model.ufo1, 1),
                    child: Ufo(),
                  ),
                  // * 雲 -----------------------------------------------------------
                  Align(
                    alignment: Alignment(0.6, model.back3),
                    child: Cloud(),
                  ),
                  Align(
                    alignment: Alignment(-1, model.back2),
                    child: Cloud(),
                  ),
                  Align(
                    alignment: Alignment(1, model.back),
                    child: Cloud(),
                  ),
                  // * 星 -----------------------------------------------------------
                  Align(
                    alignment: Alignment((model.star3 * -1), model.star3),
                    child: Star(),
                  ),
                  Align(
                    alignment: Alignment((model.star2 * -1), model.star2),
                    child: Star(),
                  ),
                  Align(
                    alignment: Alignment((model.star * -1), model.star),
                    child: Star(),
                  ),
                  // * 隕石 -----------------------------------------------------------
                  Align(
                    alignment: Alignment(0.6, model.meteorite3),
                    child: Meteorite(),
                  ),
                  Align(
                    alignment: Alignment(-1, model.meteorite2),
                    child: Meteorite(),
                  ),
                  Align(
                    alignment: Alignment(1, model.meteorite),
                    child: Meteorite(),
                  ),

                  // * ルール説明画面
                  How(model: model),
                  // * タイトル画面
                  Top(model: model),
                  // * ゲーム開始画面
                  Ready(model: model),
                  // * クリア画面
                  Clear(model: model),
                  // * ゲームオーバー画面
                  GameOver(model: model),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
