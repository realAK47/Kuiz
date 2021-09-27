import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuiz_app/constants.dart';
import 'package:kuiz_app/dataCollection.dart';
import 'package:kuiz_app/redractors.dart';
import 'package:provider/provider.dart';
import 'end_screen.dart';

class Quiz extends StatelessWidget {
  static const id = 'quiz_screen';

  bool navi = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Color(0xffededb9),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: Center(
                  child: Text(
                    Provider.of<DataCollection>(context, listen: false)
                        .questionStrings(),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      OptionCard(
                        n: 0,
                        opt: Provider.of<DataCollection>(context, listen: false)
                            .options()[0],
                        colour:
                            Provider.of<DataCollection>(context).option0Color,
                      ),
                      OptionCard(
                          n: 1,
                          opt: Provider.of<DataCollection>(context,
                                  listen: false)
                              .options()[1],
                          colour: Provider.of<DataCollection>(context)
                              .option1Color),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      OptionCard(
                          n: 2,
                          opt: Provider.of<DataCollection>(context,
                                  listen: false)
                              .options()[2],
                          colour: Provider.of<DataCollection>(context)
                              .option2Color),
                      OptionCard(
                          n: 3,
                          opt: Provider.of<DataCollection>(context,
                                  listen: false)
                              .options()[3],
                          colour: Provider.of<DataCollection>(context)
                              .option3Color),
                    ],
                  ),
                ),
              ),
              Visibility(
                child: SizedBox(
                  height: 50,
                ),
                visible: !Provider.of<DataCollection>(context).visibility,
              ),
              Visibility(
                visible: Provider.of<DataCollection>(context).visibility,
                child: FlatButton(
                  onPressed: () {
                    //TODO : call function that changes qstion and reset option color.
                    Provider.of<DataCollection>(context, listen: false)
                        .resetQuizScreen();
                    if (Provider.of<DataCollection>(context, listen: false)
                        .navi) {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => EndScreen(
                                    score: Provider.of<DataCollection>(context)
                                        .points,
                                  )));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kThemeColor,
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
