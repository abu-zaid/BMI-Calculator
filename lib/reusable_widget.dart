import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({this.colour, this.cardStyle, this.onPress});
  final Color colour;
  final Widget cardStyle;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardStyle,
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
