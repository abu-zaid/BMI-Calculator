import 'package:flutter/material.dart';
import 'constants.dart';

class IconWidget extends StatelessWidget {
  IconWidget({this.iconText,this.iconIcon});

  final String iconText;
  final IconData iconIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconIcon,
          size: 50.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          iconText,
          style: kTextStyle,
        ),
      ],
    );
  }
}
