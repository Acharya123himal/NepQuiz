import 'quiz_board.dart';

class Question {
  final ques;
  final choice1;
  final choice2;
  final choice3;
  final choice4;
  final answer;

  Question(
      {this.ques,
      this.choice1,
      this.choice2,
      this.choice3,
      this.choice4,
      this.answer});

  factory Question.fromJson(final json) {
    int _quesNum = quesRandom();
    String _i = json["results"][_quesNum]["correct_answer"],
        _j = json["results"][_quesNum]["incorrect_answers"][0],
        _k = json["results"][_quesNum]["incorrect_answers"][1],
        _l = json["results"][_quesNum]["incorrect_answers"][2];
    void swap() {
      final _temp = _i;
      _i = _k;
      _k = _l;
      _l = _j;
      _j = _temp;
    }

    for (int a = 0; a <= _quesNum; a++) {
      swap();
    }

    print("correct answer " + json["results"][_quesNum]["correct_answer"]);

    return Question(
      ques: Uri.decodeFull(json["results"][_quesNum]["question"]),
      choice1: Uri.decodeFull(_i),
      choice2: Uri.decodeFull(_j),
      choice3: Uri.decodeFull(_k),
      choice4: Uri.decodeFull(_l),
      answer: Uri.decodeFull(json["results"][_quesNum]["correct_answer"]),
    );
  }
}
