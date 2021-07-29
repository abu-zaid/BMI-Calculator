import 'package:flutter/material.dart';
import 'Screens/input_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => InputPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.

      },
    );
  }
}
