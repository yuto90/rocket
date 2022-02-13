import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

                  // * ルール説明画面
                  model.display == 'how'
                      ? Stack(
                          children: [
                            // ロケットの注釈
                            const Align(
                              alignment: Alignment(0, 0.15),
                              child: Text(
                                '↑',
                                style: TextStyle(
                                  fontSize: 75,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0.26),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors.black,
                                ),
                                height: SizeConfig.blockSizeVertical * 5,
                                width: SizeConfig.blockSizeVertical * 26,
                                child: Center(
                                  child: Text(
                                    '画面をタップすると上に移動するよ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // クリア条件の注釈
                            Align(
                              alignment: Alignment(0, -0.7),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors.black,
                                ),
                                height: SizeConfig.blockSizeVertical * 30,
                                width: SizeConfig.blockSizeVertical * 30,
                                child: Column(
                                  children: [
                                    Text(
                                      '-*-*-*-*- クリア条件 -*-*-*-*-',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'ロケットが惑星まで到達すること',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Goal(heightSize: 10, widthSize: 10),
                                    ),
                                    Text(
                                      '※特定の障害物に当たるとゲームオーバー',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Ufo(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Star(),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // 戻るボタン
                            Align(
                              alignment: Alignment(0, 0.7),
                              child: OutlinedButton(
                                onPressed: () {
                                  model.switchDisplay('top');
                                },
                                child: Text(
                                  'B A C K',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Text(''),

                  // * タイトル画面
                  model.display == 'top'
                      ? Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Rocket',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                height: 180,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  model.switchDiffculty('hard');
                                  model.switchDisplay('ready');
                                },
                                child: Text(
                                  'H A R D',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  model.switchDiffculty('normal');
                                  model.switchDisplay('ready');
                                },
                                child: Text(
                                  'N O R M A L',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  model.switchDiffculty('easy');
                                  model.switchDisplay('ready');
                                },
                                child: Text(
                                  'E A S Y',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  model.switchDisplay('how');
                                },
                                child: Text(
                                  'ルール',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Text(''),
                  // * ゲーム開始画面
                  model.display == 'ready'
                      ? Align(
                          alignment: Alignment(0, -0.2),
                          child: model.gameHasStarted
                              ? Text('')
                              : Text(
                                  'T A P  T O  P L A Y',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                        )
                      : Text(''),
                  // * ゲームオーバー画面画面
                  model.display == 'game_over'
                      ? Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'G A M E  O V E R',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                height: 180,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  //model.switchDisplay();
                                  model.display = 'ready';
                                  model.resetPosition();
                                  model.reload();
                                },
                                child: Text(
                                  'C O N T I N U E',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  //model.switchDisplay();
                                  model.display = 'top';
                                  model.resetPosition();
                                  model.reload();
                                },
                                child: Text(
                                  'E X I T',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Text(''),
                  // * ゲームクリア画面画面
                  model.display == 'clear'
                      ? Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'C L E A R !!!',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                height: 180,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  //model.switchDisplay();
                                  model.display = 'ready';
                                  model.resetPosition();
                                  model.reload();
                                },
                                child: Text(
                                  'C O N T I N U E',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  //model.switchDisplay();
                                  model.display = 'top';
                                  model.resetPosition();
                                  model.reload();
                                },
                                child: Text(
                                  'E X I T',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
