import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/quiz_board.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          valueReset();
          Navigator.pushReplacementNamed(context, 'init');
        });
        return true;
      },
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Your Score: ${getScore()}",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, 'init');
                  valueReset();
                });
              },
              child: Text(
                "Restart",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Colors.greenAccent;
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
