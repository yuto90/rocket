import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MainPageModel extends ChangeNotifier {
  String display = 'top';

  double rocketYaxis = 0;
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
  double boy = 0.5;

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

        // ヘリ -----------------------------------------------
        // 画面外に出たら
        if (heri_1 < -3) {
          heri_1 = randomDouble();
        } else {
          heri_1 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (heri_075 < -3) {
          heri_075 = randomDouble();
        } else {
          heri_075 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (heri_05 < -3) {
          heri_05 = randomDouble();
        } else {
          heri_05 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (heri_025 < -3) {
          heri_025 = randomDouble();
        } else {
          heri_025 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (heri0 < -3) {
          heri0 = randomDouble();
        } else {
          heri0 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (heri025 < -3) {
          heri025 = randomDouble();
        } else {
          heri025 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (heri05 < -3) {
          heri05 = randomDouble();
        } else {
          heri05 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (heri075 < -3) {
          heri075 = randomDouble();
        } else {
          heri075 -= 0.03;
        }
        notifyListeners();
        // 画面外に出たら
        if (heri1 < -3) {
          heri1 = randomDouble();
        } else {
          heri1 -= 0.03;
        }
        notifyListeners();

        // 背景 --------------------------------------------------
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

        if ((heri_1 <= 0.15 && heri_1 >= -0.15) &&
            (rocketYaxis < -0.85 && rocketYaxis > -1.15)) {
          timer.cancel();
          dialog(context);
        }
        if ((heri_075 <= 0.15 && heri_075 >= -0.15) &&
            (rocketYaxis < -0.6 && rocketYaxis > -0.9)) {
          timer.cancel();
          dialog(context);
        }
        if ((heri_05 <= 0.15 && heri_05 >= -0.15) &&
            (rocketYaxis < -0.35 && rocketYaxis > -0.65)) {
          timer.cancel();
          dialog(context);
        }
        if ((heri_025 <= 0.15 && heri_025 >= -0.15) &&
            (rocketYaxis < -0.1 && rocketYaxis > -0.4)) {
          timer.cancel();
          dialog(context);
        }
        if ((heri0 <= 0.15 && heri0 >= -0.15) &&
            (rocketYaxis < 0.15 && rocketYaxis > -0.15)) {
          timer.cancel();
          dialog(context);
        }

        if ((heri025 <= 0.15 && heri025 >= -0.15) &&
            (rocketYaxis < 0.4 && rocketYaxis > 0.1)) {
          timer.cancel();
          dialog(context);
        }
        if ((heri05 <= 0.15 && heri05 >= -0.15) &&
            (rocketYaxis < 0.65 && rocketYaxis > 0.35)) {
          timer.cancel();
          dialog(context);
        }
        if ((heri075 <= 0.15 && heri075 >= -0.15) &&
            (rocketYaxis < 0.9 && rocketYaxis > 0.6)) {
          timer.cancel();
          dialog(context);
        }
        if ((heri1 <= 0.15 && heri1 >= -0.15) &&
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
