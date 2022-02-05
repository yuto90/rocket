import 'package:flutter/material.dart';
import 'package:rocket/top.dart';
import 'dart:async';
import 'background.dart';
import 'ahiru.dart';
import 'cloud.dart';
import 'building.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static double ahiruYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = ahiruYaxis;
  bool gameHasStarted = false;

  // 雲
  static double cloudOne = 3.5;
  double cloudOneDie = -0.65;
  // 建物
  static double buildingOne = -0.6;
  double buildingOneDie = 0.19;
  // 背景
  double back = 1;

  void move() {
    setState(() {
      time = 0;
      initialHeight = ahiruYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(
      Duration(milliseconds: 40),
      (timer) {
        time += 0.02;
        height = -4.9 * time * time + 0.2 + time;
        setState(() {
          ahiruYaxis = initialHeight - height;
        });
        // 雲 -----------------------------------------------
        setState(() {
          // 画面外に出たら
          if (cloudOne < -8) {
            cloudOne += 16.0;
          } else {
            cloudOne -= 0.08;
          }
        });

        // 建物 --------------------------------------------------
        setState(() {
          if (buildingOne < -3) {
            buildingOne += 4.5;
          } else {
            buildingOne -= 0.1;
          }
        });

        // 建物 --------------------------------------------------
        setState(() {
          if (back < -3) {
            back += 4.5;
          } else {
            back -= 0.01;
          }
        });

        //! ゲームオーバー ======================================================
        // Y軸画面外に出たらゲームオーバー
        if (ahiruYaxis > 1.1 || ahiruYaxis < -3) {
          timer.cancel();
          dialog();
        }

        if (cloudOne <= 3 && cloudOne >= -3) {
          if (ahiruYaxis < cloudOneDie) {
            timer.cancel();
            dialog();
          }
        }
        if (buildingOne <= 0.5 && buildingOne >= -0.5) {
          if (ahiruYaxis > buildingOneDie) {
            timer.cancel();
            dialog();
          }
        }
      },
    );
  }

  void resetPosition() {
    ahiruYaxis = 0;
    time = 0;
    height = 0;
    initialHeight = ahiruYaxis;
    gameHasStarted = false;

    // 雲
    cloudOne = 3.5;
    // 建物
    buildingOne = -0.6;
    // 背景
    back = 1;
  }

  void dialog() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('ゲームオーバー'),
          content: Text("あひるは死んでしまった!\nもっかいやる?"),
          actions: <Widget>[
            // ボタン領域
            FlatButton(
                child: Text("Exit"),
                onPressed: () {
                  setState(() {
                    resetPosition();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Top(),
                    ),
                  );
                }),
            FlatButton(
              child: Text("Continue"),
              onPressed: () {
                setState(() {
                  resetPosition();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    // リセット
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          move();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  AnimatedContainer(
                    // アヒルの初期位置
                    alignment: Alignment(0, ahiruYaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: MyAhiru(),
                  ),
                  // ? 背景
                  Container(
                    alignment: Alignment(back, 1.1),
                    child: BackGround(
                      heightSize: 100.0,
                      widthSize: 100.0,
                    ),
                  ),
                  // ! ビル１ 高い
                  AnimatedContainer(
                    alignment: Alignment(0, buildingOne),
                    duration: Duration(microseconds: 0),
                    child: Building(
                      heightSize: 290.0,
                      widthSize: 100.0,
                    ),
                  ),
                  // * 雲１ 高い
                  AnimatedContainer(
                    alignment: Alignment(cloudOne, -0.9),
                    duration: Duration(microseconds: 0),
                    child: Cloud(
                      heightSize: 100.0,
                      widthSize: 300.0,
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, -0.2),
                    child: gameHasStarted
                        ? Text('')
                        : Text(
                            'T A P  T O  P L A Y',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TIME',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '0',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
