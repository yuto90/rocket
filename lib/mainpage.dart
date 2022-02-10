import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rocket/top.dart';
import 'dart:async';
import 'background.dart';
import 'heri.dart';
import 'rocket.dart';
import 'cloud.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static double rocketYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool gameHasStarted = false;

  // ヘリ
  double heri_1 = (Random().nextDouble() + 3) * 3;
  double heri_075 = (Random().nextDouble() + 1) * 3;
  double heri_05 = (Random().nextDouble() + 3) * 3;
  double heri_025 = (Random().nextDouble() + 1) * 3;
  double heri0 = (Random().nextDouble() + 3) * 3;
  double heri025 = (Random().nextDouble() + 1) * 3;
  double heri05 = (Random().nextDouble() + 3) * 3;
  double heri075 = (Random().nextDouble() + 1) * 3;
  double heri1 = (Random().nextDouble() + 3) * 3;

  double heriXDie = -0.65;
  // 背景の雲
  double back = -1;
  double back2 = -0.8;
  double back3 = -0.6;

  // 発射台
  double ground = 150;

  // オブジェクト位置リセット用の乱数を生成
  double randomDouble() {
    return (Random().nextDouble() + 1) * 3;
  }

  void move() {
    setState(() {
      time = 0;
      initialHeight = rocketYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(
      Duration(milliseconds: 30),
      (timer) {
        time += 0.015;
        height = -4.9 * time * time + 0.2 + time;
        setState(() {
          rocketYaxis = initialHeight - height;
        });

        // ヘリ -----------------------------------------------
        setState(() {
          // 画面外に出たら
          if (heri_1 < -3) {
            heri_1 = randomDouble();
          } else {
            heri_1 -= 0.03;
          }
        });
        setState(() {
          // 画面外に出たら
          if (heri_075 < -3) {
            heri_075 = randomDouble();
          } else {
            heri_075 -= 0.03;
          }
        });
        setState(() {
          // 画面外に出たら
          if (heri_05 < -3) {
            heri_05 = randomDouble();
          } else {
            heri_05 -= 0.03;
          }
        });
        setState(() {
          // 画面外に出たら
          if (heri_025 < -3) {
            heri_025 = randomDouble();
          } else {
            heri_025 -= 0.03;
          }
        });
        setState(() {
          // 画面外に出たら
          if (heri0 < -3) {
            heri0 = randomDouble();
          } else {
            heri0 -= 0.03;
          }
        });
        setState(() {
          // 画面外に出たら
          if (heri025 < -3) {
            heri025 = randomDouble();
          } else {
            heri025 -= 0.03;
          }
        });
        setState(() {
          // 画面外に出たら
          if (heri05 < -3) {
            heri05 = randomDouble();
          } else {
            heri05 -= 0.03;
          }
        });
        setState(() {
          // 画面外に出たら
          if (heri075 < -3) {
            heri075 = randomDouble();
          } else {
            heri075 -= 0.03;
          }
        });
        setState(() {
          // 画面外に出たら
          if (heri1 < -3) {
            heri1 = randomDouble();
          } else {
            heri1 -= 0.03;
          }
        });

        // 背景 --------------------------------------------------
        setState(() {
          if (back > 1.15) {
            back = -1.2;
          } else {
            back += 0.01;
          }
        });

        setState(() {
          if (back2 > 1.5) {
            back2 = -1.2;
          } else {
            back2 += 0.01;
          }
        });

        setState(() {
          if (back3 > 1.5) {
            back3 = -1.2;
          } else {
            back3 += 0.01;
          }
        });

        // 発射台 --------------------------------------------------
        if (ground > 0) {
          setState(() {
            ground -= 3;
          });
        }

        //! ゲームオーバー ======================================================
        // Y軸画面外に出たらゲームオーバー
        if (rocketYaxis > 1.1 || rocketYaxis < -1.1) {
          timer.cancel();
          dialog();
        }

        if ((heri_1 <= 0.15 && heri_1 >= -0.15) &&
            (rocketYaxis < -0.85 && rocketYaxis > -1.15)) {
          timer.cancel();
          dialog();
        }
        if ((heri_075 <= 0.15 && heri_075 >= -0.15) &&
            (rocketYaxis < -0.6 && rocketYaxis > -0.9)) {
          timer.cancel();
          dialog();
        }
        if ((heri_05 <= 0.15 && heri_05 >= -0.15) &&
            (rocketYaxis < -0.35 && rocketYaxis > -0.65)) {
          timer.cancel();
          dialog();
        }
        if ((heri_025 <= 0.15 && heri_025 >= -0.15) &&
            (rocketYaxis < -0.1 && rocketYaxis > -0.4)) {
          timer.cancel();
          dialog();
        }
        if ((heri0 <= 0.15 && heri0 >= -0.15) &&
            (rocketYaxis < 0.15 && rocketYaxis > -0.15)) {
          timer.cancel();
          dialog();
        }

        if ((heri025 <= 0.15 && heri025 >= -0.15) &&
            (rocketYaxis < 0.4 && rocketYaxis > 0.1)) {
          timer.cancel();
          dialog();
        }
        if ((heri05 <= 0.15 && heri05 >= -0.15) &&
            (rocketYaxis < 0.65 && rocketYaxis > 0.35)) {
          timer.cancel();
          dialog();
        }
        if ((heri075 <= 0.15 && heri075 >= -0.15) &&
            (rocketYaxis < 0.9 && rocketYaxis > 0.6)) {
          timer.cancel();
          dialog();
        }
        if ((heri1 <= 0.15 && heri1 >= -0.15) &&
            (rocketYaxis < 1.15 && rocketYaxis > 0.85)) {
          timer.cancel();
          dialog();
        }
      },
    );
  }

  void resetPosition() {
    rocketYaxis = 0;
    time = 0;
    height = 0;
    initialHeight = rocketYaxis;
    gameHasStarted = false;
    ground = 150;

    // ヘリ
    heri_1 = randomDouble();
    heri_075 = randomDouble();
    heri_05 = randomDouble();
    heri_025 = randomDouble();
    heri0 = randomDouble();
    heri025 = randomDouble();
    heri05 = randomDouble();
    heri075 = randomDouble();
    heri1 = randomDouble();
    //back = randomDouble();
    //back2 = randomDouble();

    back = -1;
    back2 = -0.8;
    back3 = -0.6;
    // 発射台
    ground = 150;
  }

  void dialog() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('ゲームオーバー'),
          content: Text(""),
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
        body: Stack(
          children: [
            Container(
              color: Colors.blue,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ground,
                color: Colors.brown,
              ),
            ),
            AnimatedContainer(
              // ロケットの初期位置
              alignment: Alignment(0, rocketYaxis),
              duration: Duration(milliseconds: 0),
              child: MyRocket(),
            ),
            // ? 背景
            //Container(
            //alignment: Alignment(-1, back - 1.2),
            //child: Container(
            //width: 300,
            //height: 100,
            //decoration: BoxDecoration(
            //color: Colors.white,
            //border: Border.all(width: 4, color: Colors.blue[200]),
            //borderRadius: BorderRadius.circular(60),
            //),
            //),
            //),
            // * 雲背景
            AnimatedContainer(
              alignment: Alignment(1, back3),
              duration: Duration(microseconds: 0),
              child: Cloud(),
            ),
            // * 雲背景
            AnimatedContainer(
              alignment: Alignment(-1, back2),
              duration: Duration(microseconds: 0),
              child: Cloud(),
            ),
            // * 雲背景
            AnimatedContainer(
              alignment: Alignment(1, back),
              duration: Duration(microseconds: 0),
              child: Cloud(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri_1, -1),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri_075, -0.75),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri_05, -0.5),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri_025, -0.25),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri0, 0),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri025, 0.25),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri05, 0.5),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri075, 0.75),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heri1, 1),
              duration: Duration(microseconds: 0),
              child: Heri(),
            ),
            Container(
              alignment: Alignment(0, -0.2),
              child: gameHasStarted
                  ? Text('')
                  : Text(
                      'T A P  T O  P L A Y',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
