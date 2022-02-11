import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocket/top.dart';
import 'dart:async';
import 'mainpage_model.dart';
import 'objects/background.dart';
import 'objects/boy.dart';
import 'objects/heri.dart';
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
                  Container(
                    color: Colors.blue,
                  ),
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
                  AnimatedContainer(
                    // ロケットの初期位置
                    alignment: Alignment(0, model.rocketYaxis),
                    duration: Duration(milliseconds: 0),
                    child: MyRocket(),
                  ),
                  // * 雲背景
                  AnimatedContainer(
                    alignment: Alignment(1, model.back3),
                    duration: Duration(microseconds: 0),
                    child: Cloud(),
                  ),
                  // * 雲背景
                  AnimatedContainer(
                    alignment: Alignment(-1, model.back2),
                    duration: Duration(microseconds: 0),
                    child: Cloud(),
                  ),
                  // * 雲背景
                  AnimatedContainer(
                    alignment: Alignment(1, model.back),
                    duration: Duration(microseconds: 0),
                    child: Cloud(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri_1, -1),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri_075, -0.75),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri_05, -0.5),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri_025, -0.25),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri0, 0),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri025, 0.25),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri05, 0.5),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri075, 0.75),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),
                  // * ヘリ
                  AnimatedContainer(
                    alignment: Alignment(model.heri1, 1),
                    duration: Duration(microseconds: 0),
                    child: Heri(),
                  ),

                  model.display == 'top'
                      ? Container(
                          alignment: Alignment(0, -0.2),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 130,
                              ),
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
                      : Container(
                          alignment: Alignment(0, -0.2),
                          child: model.gameHasStarted
                              ? Text('')
                              : Text(
                                  'T A P  T O  P L A Y',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
