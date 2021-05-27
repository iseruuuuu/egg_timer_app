import 'dart:ui';
import 'package:egg_timer_app/_first.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() {
  runApp(First());
}

//TODO 卵のイラストをどうにかして　揃えたい。


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClockTimer(),
    );
  }
}

class ClockTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClockTimerState();
  }
}

class _ClockTimerState extends State<ClockTimer> {
  /// 初期値
  var _timeString = '00:00:00';
  /// 開始時間
  DateTime _startTime;
  /// ローカルタイマー
  var _timer;
  var _isStart = false;

  int count = 0;

  //初期の卵
  var image = 'assets/images/1.jpeg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('半熟卵・タイマー')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(image),

          SizedBox(height: 40,),

          Center(child: Text(_timeString, style: TextStyle(fontSize: 60))),

          SizedBox(height: 40,),

          Container(
            width: 200,
            height: 100,
            color: Colors.greenAccent,
            child: TextButton(
              onPressed: _startTimer,
              child: Text(_isStart ? 'ストップ' : 'スタート',style: TextStyle(fontSize: 30),),),
          ),

          SizedBox(height: 20),
          Container(
            width: 200,
            height: 100,
            color: Colors.greenAccent,
            child: TextButton(
              onPressed: resetTimer,
              child: Text('リセット',style: TextStyle(fontSize: 30),),),
          )
        ],
      ),
    );
  }

  void _startTimer() {

    //TODO タイマーを一時停止と再開を選びたい＝＞bool型
    setState(() {
      count++;
     // if (_isStart) {
      if (count == 1) {
        _startTime = DateTime.now();
        _timer  = Timer.periodic(Duration(seconds: 1), _onTimer);
      } else {
       // _timer.cancel();
      }
    });
  }

  void resetTimer() {
    count = 0;
    setState(() {
        _timeString = '00:00:00';
        _timer.cancel();
        image = 'assets/images/1.jpeg';
    });
  }

  void _onTimer(Timer timer) {
    /// 現在時刻を取得
    var now = DateTime.now();
    /// 開始時刻と比較して差分を取得
    var diff = now.difference(_startTime).inSeconds;

    /// タイマーのロジック
    var hour = (diff / (60 * 60)).floor();
    var mod = diff % (60 * 60);
    var minutes = (mod / 60).floor();
    var second = mod % 60;

    setState(() => {
      _timeString = """${_convertTwoDigits(hour)}:${_convertTwoDigits(minutes)}:${_convertTwoDigits(second)}""",

      //TODO 後で記載する。
      if (_timeString == "00:00:04") {
        image = 'assets/images/6.png',
      }else if (_timeString == "00:00:10"){
        image = 'assets/images/7.png',
      }else if (_timeString == "00:00:20"){
        image = 'assets/images/8.png',
      }else if (_timeString == "00:00:30"){

      }else if (_timeString == "00:00:40"){

      }else if (_timeString == "00:00:50"){

      }else if (_timeString == "00:00:60"){

      }
    });

  }

  String _convertTwoDigits(int number) {
    return number >= 10 ? "$number" : "0$number";
  }
}








