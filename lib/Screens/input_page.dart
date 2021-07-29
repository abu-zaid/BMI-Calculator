import 'package:bmi_calculator/Screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../icon_widget.dart';
import '../reusable_widget.dart';
import '../constants.dart';
import 'package:bmi_calculator/calculater_brain.dart';

enum genderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

@override
class _InputPageState extends State<InputPage> {
  int height = 170;
  int weight = 50;
  int age = 25;
  genderType selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.male;
                      });
                    },
                    colour: selectedGender == genderType.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardStyle: IconWidget(
                      iconIcon: FontAwesomeIcons.mars,
                      iconText: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.female;
                      });
                    },
                    colour: selectedGender == genderType.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardStyle: IconWidget(
                      iconIcon: FontAwesomeIcons.venus,
                      iconText: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              colour: kInactiveCardColour,
              cardStyle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBoldTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      inactiveColor: Color(0xff8d8e98),
                      onChanged: (double newValue) {
                        setState(
                          () {
                            height = newValue.round();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    colour: kInactiveCardColour,
                    cardStyle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onChange: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onChange: () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    colour: kInactiveCardColour,
                    cardStyle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onChange: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onChange: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onPressButton: () {
              CalculatorBrain calc= CalculatorBrain(height: height,weight: weight);


              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmi: calc.calculateBMI(),
                  bmiText: calc.bmiText(),
                  evaluateText: calc.evaluateText(),
                )),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.text, @required this.onPressButton});
  final String text;
  final Function onPressButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressButton,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: kTextStyle,
        )),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomContainerColour,
        height: kBottomNavbarHeight,
        width: double.infinity,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onChange});
  final IconData icon;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onChange,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4E5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
