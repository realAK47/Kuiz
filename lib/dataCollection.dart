import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuiz_app/screens/quiz_screen.dart';

class DataCollection extends ChangeNotifier {
  Map map = Map<String, bool>();
  bool navi = false;
  bool enable = true;
  int points = 0;
  Color option0Color = Colors.white;
  Color option1Color = Colors.white;
  Color option2Color = Colors.white;
  Color option3Color = Colors.white;

  int n = 0;
  int k = 0;
  String questionString;
  String correctAnswer;
  bool visibility = false;
  int wrong = 0;
  List<String> list = [];
  dynamic data;
  void dataTaking(dynamic dataTaken) {
    data = dataTaken;
    notifyListeners();
  }

  void question() {
    questionString = data["results"][k]['question'].toString();
    correctAnswer = data["results"][k]['correct_answer'].toString();
    map[correctAnswer] = true;
    map[data["results"][k]['incorrect_answers'][0].toString()] = false;
    map[data["results"][k]['incorrect_answers'][1].toString()] = false;
    map[data["results"][k]['incorrect_answers'][2].toString()] = false;
    list.add(data["results"][k]['correct_answer'].toString());
    list.add(data["results"][k]['incorrect_answers'][0].toString());
    list.add(data["results"][k]['incorrect_answers'][1].toString());
    list.add(data["results"][k]['incorrect_answers'][2].toString());
    notifyListeners();
  }

  void shuffle() {
    list.shuffle();
  }

  String questionStrings() {
    return questionString.toString();
  }

  List<String> options() {
    return list;
  }

  void optionColor(String str, int n) {
    bool val = map[str];
    print(n);
    if (val) {
      points = points + 1;
      if (n == 0) {
        option0Color = Colors.green;
      } else if (n == 1) {
        option1Color = Colors.green;
      } else if (n == 2) {
        option2Color = Colors.green;
      } else if (n == 3) {
        option3Color = Colors.green;
      }
    } else {
      wrong += 1;
      if (n == 0) {
        option0Color = Colors.redAccent;
      } else if (n == 1) {
        option1Color = Colors.redAccent;
      } else if (n == 2) {
        option2Color = Colors.redAccent;
      } else if (n == 3) {
        option3Color = Colors.redAccent;
      }
    }
    if (list[0] == correctAnswer) {
      option0Color = Colors.green;
    } else if (list[1] == correctAnswer) {
      option1Color = Colors.green;
    } else if (list[2] == correctAnswer) {
      option2Color = Colors.green;
    } else if (list[3] == correctAnswer) {
      option3Color = Colors.green;
    }
    enable = false;
    visibility = true;
    notifyListeners();
  }

  void resetQuizScreen() {
    if (k < 9) {
      option0Color = Colors.white;
      option1Color = Colors.white;
      option2Color = Colors.white;
      option3Color = Colors.white;
      enable = true;
      k++;

      map.clear();
      list.clear();
      question();
      visibility = false;
      shuffle();

      //list.clear();
      //question();
      notifyListeners();
    } else if (k >= 9 || wrong > 2) {
      navi = true;
      notifyListeners();
    }
  }
}
