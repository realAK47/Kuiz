import 'package:flutter/material.dart';
import 'package:kuiz_app/Networking.dart';
import 'package:kuiz_app/constants.dart';
import 'package:kuiz_app/dataCollection.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuiz_app/screens/category.dart';
import 'welcome_screen.dart';
import 'package:provider/provider.dart';

Network network = Network();
//DataCollection dataCollection = DataCollection();

class LoadingScreen extends StatefulWidget {
  static const id = 'loading_screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void loadQuestions() async {
    var data = await network.getQuestion();
    Provider.of<DataCollection>(context, listen: false).dataTaking(data);
    Provider.of<DataCollection>(context, listen: false).question();
    Navigator.pushNamed((context), WelcomeScreen.id);
  }

  void initState() {
    // TODO: implement initStates
    super.initState();
    loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColor,
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
