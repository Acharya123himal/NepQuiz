import 'package:flutter/material.dart';
import 'package:nepquiz/widgets/answer_card.dart';
import '../model/quiz_board.dart';
import '../model/question.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum QIndex { first, second, third, fourth }

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late QIndex qIndex;
  CountDownController _controller = CountDownController();
  int _duration = 60;

  @override
  void initState() {
    super.initState();
  }

  void showResult() {
    Navigator.pushNamed(context, "result");
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            valueReset();
            Navigator.pushNamed(context, 'init');
            return true;
          },
          child: FutureBuilder<Question>(
            future: quizOrder(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final questions = snapshot.data;
                return Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CircularCountDownTimer(
                          duration: _duration,
                          controller: _controller,
                          width: MediaQuery.of(context).size.width / 14,
                          height: MediaQuery.of(context).size.height / 14,
                          ringColor: Color(0xffe0e0e0),
                          fillColor: Color(0xFFEA80FC),
                          backgroundColor: Colors.purple[500],
                          strokeWidth: 10.0,
                          textStyle: TextStyle(
                              fontSize: 33.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: true,
                          autoStart: true,
                          onStart: () {},
                          onComplete: () {
                            Navigator.pushReplacementNamed(context, "result");
                          },
                        ),
                        Container(
                          child: Text(
                            "Question ${(getScore() + 1).toString()}: ",
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${questions!.ques}",
                            style: TextStyle(fontSize: 25, color: Colors.green),
                          ),
                        ),
                        OptionCard(
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  if (questions.choice1 == questions.answer) {
                                    scoreAddition();
                                    _controller.restart();
                                  } else {
                                    showResult();
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Text("${questions.choice1}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                  Expanded(
                                      child: Icon(FontAwesomeIcons.checkCircle))
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.greenAccent,
                              )),
                        ),
                        OptionCard(
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  if (questions.choice2 == questions.answer) {
                                    scoreAddition();
                                    _controller.restart();
                                  } else {
                                    showResult();
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Text("${questions.choice2}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                  Expanded(
                                      child: Icon(FontAwesomeIcons.checkCircle))
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.greenAccent,
                              )),
                        ),
                        OptionCard(
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  if (questions.choice3 == questions.answer) {
                                    scoreAddition();
                                    _controller.restart();
                                  } else {
                                    showResult();
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      "${questions.choice3}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                      child: Icon(FontAwesomeIcons.checkCircle))
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.greenAccent,
                              )),
                        ),
                        OptionCard(
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  if (questions.choice4 == questions.answer) {
                                    _controller.restart();

                                    scoreAddition();
                                  } else {
                                    showResult();
                                  }
                                });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Text("${questions.choice4}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                  Expanded(
                                      child: Icon(FontAwesomeIcons.checkCircle))
                                ],
                              ),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.greenAccent,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {}
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
