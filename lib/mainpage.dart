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

  // 雲
  double cloudX = 0;
  double cloudXDie = -0.65;
  // 雲
  double heriX = 0;
  double heriXDie = -0.65;
  // 背景
  double back = 0;

  // 発射台
  double ground = 150;

  void move() {
    setState(() {
      time = 0;
      initialHeight = rocketYaxis;
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
          rocketYaxis = initialHeight - height;
        });
        // 雲 -----------------------------------------------
        setState(() {
          // 画面外に出たら
          if (cloudX < -8) {
            cloudX += 16.0;
          } else {
            cloudX -= 0.08;
          }
        });

        // ヘリ -----------------------------------------------
        setState(() {
          // 画面外に出たら
          if (heriX < -8) {
            heriX += 16.0;
          } else {
            heriX -= 0.08;
          }
        });

        // 建物 --------------------------------------------------
        setState(() {
          back += 0.01;
        });

        // 発射台 --------------------------------------------------
        if (ground > 0) {
          setState(() {
            ground -= 2;
          });
        }

        //! ゲームオーバー ======================================================
        // Y軸画面外に出たらゲームオーバー
        if (rocketYaxis > 1.1 || rocketYaxis < -3) {
          timer.cancel();
          dialog();
        }

        //if (cloudX <= 3 && cloudX >= -3) {
        //if (rocketYaxis < cloudXDie) {
        //timer.cancel();
        //dialog();
        //}
        //}
      },
    );
  }

  void resetPosition() {
    rocketYaxis = 0;
    time = 0;
    height = 0;
    initialHeight = rocketYaxis;
    gameHasStarted = false;

    cloudX = 3.5;
    heriX = 3.5;
    back = 0;
    ground = 150;
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
            Container(
              alignment: Alignment(-1, back - 1.2),
              child: Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 4, color: Colors.blue[200]),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
            // * 雲１
            AnimatedContainer(
              alignment: Alignment(cloudX, -0.5),
              duration: Duration(microseconds: 0),
              child: Cloud(
                heightSize: 100.0,
                widthSize: 300.0,
              ),
            ),
            // * ヘリ
            AnimatedContainer(
              alignment: Alignment(heriX, -0.5),
              duration: Duration(microseconds: 0),
              child: Heri(
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
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
