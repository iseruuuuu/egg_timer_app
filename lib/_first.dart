//TODO 熱湯に入れて茹でる。
//TODO しっかり沸いた状態にする。
//TODO 卵を冷蔵庫に入れる
//TODO おたまを使用してそっと入れる(割れないように)
//TODO 茹で終わったら、お湯を捨てる
//TODO お湯を捨てたら、すぐに水を入れて冷やす（余熱を防ぐ）


import 'package:egg_timer_app/_second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        home: new FirstHome());
  }
}

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('簡単ガイド①'),
        ),
        backgroundColor:Colors.white,

        child: Column(

          children: [

            SizedBox(height: 150,),

            Center(child: Text('卵を冷蔵庫に入れておいてください',style: TextStyle(fontSize: 25),)),

            SizedBox(height: 100,),

            Image.asset('assets/images/10.png',height: 250,),

            SizedBox(height: 150,),

            Center(
              child: FlatButton(
                color: Colors.blue,
                child: Text('Next',style:TextStyle(color:Colors.white,fontSize: 60),),
                onPressed: () {
                  // ここにボタンを押した時に呼ばれるコードを書く
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Second(),)
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}