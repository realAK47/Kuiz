import 'package:flutter/material.dart';
import 'package:kuiz_app/dataCollection.dart';
import 'package:kuiz_app/screens/category.dart';
import 'package:kuiz_app/screens/end_screen.dart';
import 'package:kuiz_app/screens/loading_screen.dart';
import 'package:kuiz_app/screens/quiz_screen.dart';
import 'package:kuiz_app/screens/welcome_screen.dart';
import 'package:kuiz_app/screens/end_screen.dart';
import 'package:provider/provider.dart';
import 'dataCollection.dart';
import 'screens/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataCollection>(
      create: (context) => DataCollection(),
      child: MaterialApp(
        //theme: ThemeData(backgroundColor: ),
        initialRoute: LoadingScreen.id,
        routes: {
          LoadingScreen.id: (context) => LoadingScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          Quiz.id: (context) => Quiz(),
          EndScreen.id: (context) => EndScreen(),
          Category.id: (context) => Category()
        },
      ),
    );
  }
}
