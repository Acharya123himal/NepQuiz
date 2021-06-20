import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as https;
import 'question.dart';

Future<Question> quizOrder() async {
  var url = Uri.http(
      "opentdb.com", '/api.php?amount=50&type=multiple&encode=url3986');
  final response = await https.get(url);
  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    return Question.fromJson(result);
  } else {
    throw Exception();
  }
}

int _quesNum = quesRandom();

int quesRandom() {
  Random random = Random();
  _quesNum = random.nextInt(40);
  return _quesNum;
}

bool _showResult = false;

bool showResultCheck() {
  return _showResult;
}

int _score = 0;

int getScore() {
  return _score;
}

int scoreAddition() {
  return _score++;
}

void valueReset() {
  _quesNum = quesRandom();
  _showResult = false;
  _score = 0;
}
