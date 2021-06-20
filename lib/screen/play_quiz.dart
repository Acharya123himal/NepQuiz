import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nepquiz/acessories/nav_helper.dart';
import 'package:nepquiz/widgets/answer_card.dart';
import '../model/quiz_board.dart';
import '../model/question.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class PlayQuiz extends StatefulWidget {
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  CountDownController _controller = CountDownController();
  int _duration = 60;

  @override
  void initState() {
    super.initState();
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
                        Center(
                          child: Text(
                            'Q${(getScore() + 1).toString()}: ' +
                                "${questions!.ques}",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CircularCountDownTimer(
                          duration: _duration,
                          controller: _controller,
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 5,
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
                            navHelper(context, 'result');
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OptionCard(
                                'A', questions.choice1, questions.answer),
                            SizedBox(
                              width: 20,
                            ),
                            OptionCard(
                                'B', questions.choice2, questions.answer),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OptionCard(
                                'C', questions.choice3, questions.answer),
                            SizedBox(
                              width: 20,
                            ),
                            OptionCard(
                                'D', questions.choice4, questions.answer),
                          ],
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
