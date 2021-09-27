import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:kuiz_app/Networking.dart';
import 'package:kuiz_app/dataCollection.dart';
import 'package:kuiz_app/screens/quiz_screen.dart';
import 'package:kuiz_app/constants.dart';
import 'package:provider/provider.dart';

Network network = Network();

class WelcomeScreen extends StatelessWidget {
  static const id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'bulb',
                child: Icon(
                  Icons.lightbulb_outline,
                  size: queryData.size.width * 0.4,
                  color: kThemeColor,
                ),
              ),
              TextLiquidFill(
                text: 'KuiZ',
                boxBackgroundColor: Colors.white,
                waveColor: kThemeColor,
                waveDuration: Duration(seconds: 1),
                textStyle: TextStyle(
                  color: Color(0xfffcc612),
                  fontWeight: FontWeight.w900,
                  fontSize: queryData.size.width * 0.3,
                  fontFamily: 'PottaOne',
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: 2),
                child: FlatButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pushNamed(context, Quiz.id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kThemeColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: queryData.size.width * 0.15,
                    width: queryData.size.width * 0.5,
                    child: Center(
                      child: Text(
                        'START',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
