import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuiz_app/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EndScreen extends StatelessWidget {
  static const id = "end_screen";
  EndScreen({this.score});
  int score;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xfff4f7de),
      body: Padding(
        padding: EdgeInsets.all(queryData.size.width * 0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: queryData.size.height * 0.25,
              child: ColorizeAnimatedTextKit(
                text: ["KuiZ"],
                textStyle: TextStyle(
                  fontSize: queryData.size.width * 0.15,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'PottaOne',
                ),
                colors: [
                  kThemeColor,
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: ColorizeAnimatedTextKit(
                text: ["Score:$score"],
                textStyle: TextStyle(
                    fontSize: queryData.size.width * 0.075,
                    fontWeight: FontWeight.w900),
                colors: [
                  kThemeColor,
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                textAlign: TextAlign.start,
              ),
            ),
            CircularPercentIndicator(
              circularStrokeCap: CircularStrokeCap.round,
              radius: queryData.size.height * 0.3,
              lineWidth: 30,
              progressColor: Colors.green,
              backgroundColor: Colors.red,
              percent: score / 10,
              animation: true,
              animationDuration: 3000,
              center: Icon(
                Icons.lightbulb,
                color: kThemeColor,
                size: 100,
              ),
            ),
            ColorizeAnimatedTextKit(
              text: ["Congratulations!"],
              textStyle: TextStyle(
                  fontSize: queryData.size.width * 0.05,
                  fontWeight: FontWeight.w900,
                  color: kThemeColor),
              colors: [
                kThemeColor,
                Colors.purple,
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ],
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
