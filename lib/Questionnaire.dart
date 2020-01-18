import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insurance/support.dart';

import 'BLOC/questions.dart';

class Questionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation o = MediaQuery.of(context).orientation;
    ScreenUtil.init(context,
        width: (o == Orientation.portrait) ? 375 : 812,
        height: (o == Orientation.portrait) ? 812 : 375,
        allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: (o == Orientation.portrait) ? w(375) : w(812),
          height: (o == Orientation.portrait) ? h(812) : w(812),
          child: Stack(children: <Widget>[
            MyStackWidget(
              top: 115,
              //bottom: 10,
              start: 46,
              height: 235.5,
              width: 282.5,
              child: SvgPicture.asset(
                'assets/undraw_questions_75e0.svg',
                semanticsLabel: "login",
                height: 200,
                width: 200,
              ),
            ),
            MyStackWidget(
              top:420 ,
              start:33 ,
              height: 192,
              width:309 ,
              child: PageView(
                children: Question.map((s) => MyContainer(s: s,)).toList(),
              ),
            ),
//            MyStackWidget(
//              top: 630,
//              //bottom: 10,
//              start: 110,
//              height: 32,
//              end: 110,
//              child: RaisedButton(
//                child: Text(
//                  'Continue',
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontFamily: "Raleway Light",
//                      fontSize: sp(16)),
//                ),
//                color: Color(0xff645BEB),
//                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                shape: RoundedRectangleBorder(
//                  borderRadius: new BorderRadius.circular(18.0),
//                  //side: BorderSide(color: Colors.red)
//                ),
//                // color: Colors.deepPurpleAccent,
//                onPressed: () {
//                },
//
//                splashColor: Colors.grey,
//              ),
//            ),
          ]),
        ),
      ),
    );
  }
} //Scaffold

class MyContainer extends StatelessWidget {
  String s;
  MyContainer({this.s});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          MyStackWidget(
            top: 479 - 420.0,
            //bottom: 10,
            start: 55-33.0,
            height: 48,
            width: 288,
            child: Text(
              s,
              textAlign: TextAlign.left,
              style: TextStyle(fontFamily: "Ubuntu", fontSize: sp(20)),
            ),
          ),
          MyStackWidget(
            top: 560 - 420.0 ,
            //bottom: 10,
            start: 44-33.0,
            //end: 59,
            height: 37,
            width: 268,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter your answer here',
                hintStyle: TextStyle(color: Color(0xff645BEB)),
                contentPadding: EdgeInsets.only(left: w(20), top: h(5)),
                // fillColor: Colors.indigoAccent[50],
                fillColor: Color(0xffDDDBFE).withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(120),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

        ],

      ),
    );
  }
}
