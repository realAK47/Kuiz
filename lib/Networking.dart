import 'package:http/http.dart';
import 'dart:convert';

class Network {
  final String url = 'https://opentdb.com/api.php?amount=50&category=17';

  Future<dynamic> getQuestion() async {
    Response response = await get(url);
    var deCoded = jsonDecode(response.body);
    return deCoded;
  }
}
