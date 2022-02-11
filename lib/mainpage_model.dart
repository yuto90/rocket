import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class MainPageModel extends ChangeNotifier {
  String display = 'top';

  double rocketYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool gameHasStarted = false;

  // ヘリ
  double ufo_1 = (Random().nextDouble() + 3) * 3;
  double ufo_075 = (Random().nextDouble() + 1) * 3;
  double ufo_05 = (Random().nextDouble() + 3) * 3;
  double ufo_025 = (Random().nextDouble() + 1) * 3;
  double ufo0 = (Random().nextDouble() + 3) * 3;
  double ufo025 = (Random().nextDouble() + 1) * 3;
  double ufo05 = (Random().nextDouble() + 3) * 3;
  double ufo075 = (Random().nextDouble() + 1) * 3;
  double ufo1 = (Random().nextDouble() + 3) * 3;

  double ufoXDie = -0.65;
  // 背景の雲
  double back = -1;
  double back2 = -0.8;
  double back3 = -0.6;

  // 発射台
  double ground = 150;
  double boy = 0.5;

  // 宇宙の背景色
  double black = 0;

  int count = 0;

  // initState的なやつ
  MainPageModel() {
    initValue();
  }

  void initValue() {
    print('init');
  }

  // オブジェクト位置リセット用の乱数を生成
  double randomDouble() {
    return (Random().nextDouble() + 1) * 3;
  }

  void switchDisplay() {
    display = 'ready';
    notifyListeners();
  }

  void move() {
    time = 0;
    initialHeight = rocketYaxis;
    notifyListeners();
  }

  void startGame(context) {
    gameHasStarted = true;
    Timer.periodic(
      Duration(milliseconds: 30),
      (timer) {
        time += 0.015;
        height = -4.9 * time * time + 0.2 + time;
        rocketYaxis = initialHeight - height;
        notifyListeners();

        count += 30;
        // 1分経過したら背景を黒にする
        if (black < 1500 && count >= 36000) {
          black += 3;
        }

        // ヘリ -----------------------------------------------
        // 画面外に出たら
        if (ufo_1 < -3) {
          ufo_1 = randomDouble();
        } else {
          ufo_1 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (ufo_075 < -3) {
          ufo_075 = randomDouble();
        } else {
          ufo_075 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (ufo_05 < -3) {
          ufo_05 = randomDouble();
        } else {
          ufo_05 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (ufo_025 < -3) {
          ufo_025 = randomDouble();
        } else {
          ufo_025 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (ufo0 < -3) {
          ufo0 = randomDouble();
        } else {
          ufo0 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (ufo025 < -3) {
          ufo025 = randomDouble();
        } else {
          ufo025 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (ufo05 < -3) {
          ufo05 = randomDouble();
        } else {
          ufo05 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (ufo075 < -3) {
          ufo075 = randomDouble();
        } else {
          ufo075 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (ufo1 < -3) {
          ufo1 = randomDouble();
        } else {
          ufo1 -= 0.03;
        }
        notifyListeners();

        //雲  --------------------------------------------------
        if (back > 1.15) {
          back = -1.2;
        } else {
          back += 0.01;
        }
        notifyListeners();

        if (back2 > 1.5) {
          back2 = -1.2;
        } else {
          back2 += 0.01;
        }
        notifyListeners();

        if (back3 > 1.5) {
          back3 = -1.2;
        } else {
          back3 += 0.01;
        }
        notifyListeners();

        // 発射台 --------------------------------------------------
        if (ground > 0) {
          ground -= 3;
          notifyListeners();
        }
        if (boy > 0) {
          boy -= 0.01;
          notifyListeners();
        }

        //! ゲームオーバー ======================================================
        // Y軸画面外に出たらゲームオーバー
        if (rocketYaxis > 1.1 || rocketYaxis < -1.1) {
          timer.cancel();
          dialog(context);
        }

        if ((ufo_1 <= 0.15 && ufo_1 >= -0.15) &&
            (rocketYaxis < -0.85 && rocketYaxis > -1.15)) {
          timer.cancel();
          dialog(context);
        }
        if ((ufo_075 <= 0.15 && ufo_075 >= -0.15) &&
            (rocketYaxis < -0.6 && rocketYaxis > -0.9)) {
          timer.cancel();
          dialog(context);
        }
        if ((ufo_05 <= 0.15 && ufo_05 >= -0.15) &&
            (rocketYaxis < -0.35 && rocketYaxis > -0.65)) {
          timer.cancel();
          dialog(context);
        }
        if ((ufo_025 <= 0.15 && ufo_025 >= -0.15) &&
            (rocketYaxis < -0.1 && rocketYaxis > -0.4)) {
          timer.cancel();
          dialog(context);
        }
        if ((ufo0 <= 0.15 && ufo0 >= -0.15) &&
            (rocketYaxis < 0.15 && rocketYaxis > -0.15)) {
          timer.cancel();
          dialog(context);
        }

        if ((ufo025 <= 0.15 && ufo025 >= -0.15) &&
            (rocketYaxis < 0.4 && rocketYaxis > 0.1)) {
          timer.cancel();
          dialog(context);
        }
        if ((ufo05 <= 0.15 && ufo05 >= -0.15) &&
            (rocketYaxis < 0.65 && rocketYaxis > 0.35)) {
          timer.cancel();
          dialog(context);
        }
        if ((ufo075 <= 0.15 && ufo075 >= -0.15) &&
            (rocketYaxis < 0.9 && rocketYaxis > 0.6)) {
          timer.cancel();
          dialog(context);
        }
        if ((ufo1 <= 0.15 && ufo1 >= -0.15) &&
            (rocketYaxis < 1.15 && rocketYaxis > 0.85)) {
          timer.cancel();
          dialog(context);
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
    black = 0;

    count = 0;
    // ヘリ
    ufo_1 = randomDouble();
    ufo_075 = randomDouble();
    ufo_05 = randomDouble();
    ufo_025 = randomDouble();
    ufo0 = randomDouble();
    ufo025 = randomDouble();
    ufo05 = randomDouble();
    ufo075 = randomDouble();
    ufo1 = randomDouble();
    //back = randomDouble();
    //back2 = randomDouble();

    back = -1;
    back2 = -0.8;
    back3 = -0.6;
    // 発射台
    ground = 150;
  }

  void dialog(context) async {
    await showDialog(
      context: context,
      barrierDismissible: false, //ダイアログ外をタップしても消えないようにする
      builder: (_) {
        return AlertDialog(
          title: Text('ゲームオーバー'),
          content: Text(""),
          actions: <Widget>[
            // ボタン領域
            FlatButton(
                child: Text("Exit"),
                onPressed: () {
                  resetPosition();
                  display = 'top';
                  notifyListeners();
                  Navigator.of(context).pop();
                }),
            FlatButton(
              child: Text("Continue"),
              onPressed: () {
                resetPosition();
                notifyListeners();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
