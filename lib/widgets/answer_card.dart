import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nepquiz/acessories/nav_helper.dart';

class OptionCard extends StatefulWidget {
  final String qIndex;
  final String option;
  final String answer;
  OptionCard(this.qIndex, this.option, this.answer);

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.18,
      child: NeumorphicButton(
        onPressed: () {
          if (widget.option == widget.answer) {
          } else {
            navHelper(context, 'result');
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.lightGreenAccent,
              child: Text(widget.qIndex),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.option}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        style: NeumorphicStyle(
          surfaceIntensity: 0.15,
          boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.all(Radius.circular(15))),
          shape: NeumorphicShape.concave,
          color: Colors.white,
        ),
      ),
    );
  }
}
