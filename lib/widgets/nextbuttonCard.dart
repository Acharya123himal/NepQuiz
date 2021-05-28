import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final nextChild;
  NextButton(this.nextChild);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: nextChild,
    );
  }
}
