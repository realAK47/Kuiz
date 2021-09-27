import 'package:flutter/material.dart';
import 'package:kuiz_app/constants.dart';

class Category extends StatelessWidget {
  static const String id = "category";

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kThemeColor,
      appBar: AppBar(
        backgroundColor: kThemeColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'KuiZ',
                style: TextStyle(
                  fontFamily: 'PottaOne',
                  fontSize: queryData.size.width * 0.05,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Hero(
                tag: 'bulb',
                child: Icon(
                  Icons.lightbulb,
                  size: queryData.size.width * 0.08,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
