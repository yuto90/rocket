import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mainpage_model.dart';
import 'objects/boy.dart';
import 'objects/ufo.dart';
import 'objects/rocket.dart';
import 'objects/cloud.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    color: Colors.black,
                    height: model.black,
                  ),
                  // * 地面 ----------------------------------------------------------
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: model.ground,
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
                  // * ロケット ---------------------------------------------------------
                  AnimatedContainer(
                    // ロケットの初期位置
                    alignment: Alignment(0, model.rocketYaxis),
                    duration: Duration(milliseconds: 0),
                    child: MyRocket(),
                  ),
                  // * ヘリ -----------------------------------------------------------
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
                                  model.switchDisplay();
                                },
                                child: Text(
                                  'S T A R T',
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
