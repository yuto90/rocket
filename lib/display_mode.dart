import 'package:flutter/material.dart';
import 'objects/goal.dart';
import 'objects/star.dart';
import 'objects/ufo.dart';
import 'size_config.dart';

class DisplayMode extends StatelessWidget {
  final model;
  DisplayMode({this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                            child: Goal(heightSize: 10, widthSize: 10),
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        model.switchDiffculty('normal');
                        model.switchDisplay('ready');
                      },
                      child: Text(
                        'N O R M A L',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        model.switchDiffculty('easy');
                        model.switchDisplay('ready');
                      },
                      child: Text(
                        'E A S Y',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        model.switchDisplay('how');
                      },
                      child: Text(
                        'ルール',
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
              )
            : Text(''),

        // * クリア画面 & ゲームオーバー画面
        model.display == 'clear' || model.display == 'game_over'
            ? Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      model.display == 'clear'
                          ? 'C L E A R !!!'
                          : 'G A M E  O V E R',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            : Text(''),
      ],
    );
  }
}
