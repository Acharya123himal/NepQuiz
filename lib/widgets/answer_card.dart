import 'package:flutter/material.dart';

class OptionCard extends StatefulWidget {
  final Widget optionCard;
  OptionCard(this.optionCard);

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
      child: Center(
        child: Container(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height / 12,
            child: widget.optionCard,
          ),
        ),
      ),
    );
  }
}
