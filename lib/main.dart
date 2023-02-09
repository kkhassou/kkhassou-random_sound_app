import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audio_cache.dart';

// const SOUND_MIGI = 'sounds/migi.mp3';
// const SOUND_HIDARI = 'sounds/hidari.mp3';
// const SOUND_UE = 'sounds/ue.mp3';
// const SOUND_SITA = 'sounds/sita.mp3';

const SOUND_MIGI = 'migi.mp3';
const SOUND_HIDARI = 'hidari.mp3';
const SOUND_UE = 'ue.mp3';
const SOUND_SITA = 'sita.mp3';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ランダム音トレーニング'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;
  final _chache = AudioCache();
  bool checkflagRight = false;
  bool checkflagLeft = false;
  bool checkflagTop = false;
  bool checkflagBottom = false;

  int set_seconds = 5;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Container(
                child: Text("何秒間隔？"),
              ),
              // TextField()
            ]),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.blue,
                  value: checkflagRight,
                  onChanged: (flag) {
                    print("flag");
                    print(flag);
                    setState(() {
                      checkflagRight = flag!;
                    });
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("みぎ"),
                ),
                Checkbox(
                  activeColor: Colors.blue,
                  value: checkflagLeft,
                  onChanged: (flag) {
                    print("flag");
                    print(flag);
                    setState(() {
                      checkflagLeft = flag!;
                    });
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("ひだり"),
                ),
                Checkbox(
                  activeColor: Colors.blue,
                  value: checkflagTop,
                  onChanged: (flag) {
                    print("flag");
                    print(flag);
                    setState(() {
                      checkflagTop = flag!;
                    });
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("うえ"),
                ),
                Checkbox(
                  activeColor: Colors.blue,
                  value: checkflagBottom,
                  onChanged: (flag) {
                    print("flag");
                    print(flag);
                    setState(() {
                      checkflagBottom = flag!;
                    });
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("した"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('スタート'),
                  // style: ElevatedButton.styleFrom(
                  //   // primary: Colors.blue,
                  //   // onPrimary: Colors.black,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  // ),
                  onPressed: () {
                    _timer =
                        Timer.periodic(Duration(seconds: set_seconds), (timer) {
                      var rand = Random();
                      var rand_num = rand.nextInt(2);
                      if (rand_num == 0) {
                        _chache.play(SOUND_MIGI);
                      } else {
                        _chache.play(SOUND_HIDARI);
                      }
                    });
                  },
                ),
                Container(
                  width: 100,
                ),
                ElevatedButton(
                  child: const Text('ストップ'),
                  // style: ElevatedButton.styleFrom(
                  //   // primary: Colors.green,
                  //   // onPrimary: Colors.black,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  // )
                  // ,
                  onPressed: () {
                    // _chache.clearCache();
                    // _timer.cancel();
                    cancel();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void cancel() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }
}
