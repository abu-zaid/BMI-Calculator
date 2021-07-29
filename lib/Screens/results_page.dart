import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
ResultPage({@required this.bmi,@required this.bmiText,@required this.evaluateText});
  final String bmi;
  final String bmiText;
  final String evaluateText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Result',
                style: kBoldTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ReusableWidget(
                colour: kInactiveCardColour,
                cardStyle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiText,
                      style:
                          TextStyle(color: Colors.greenAccent, fontSize: 35.0),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                        fontSize: 100.0,
                      ),
                    ),
                    Text(
                      evaluateText,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          BottomButton(text: "RETRY CALCULATION",onPressButton: () {
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
