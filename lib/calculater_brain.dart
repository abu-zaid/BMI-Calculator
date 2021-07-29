import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final height;
  final weight;
  double _bmi;

  String calculateBMI(){
    _bmi= weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiText(){
    if (_bmi>25.0)
      return 'OVERWEIGHT';
    else if (_bmi<25 && _bmi>18)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }
  String evaluateText(){
    if (_bmi>25.0)
      return 'Eat less please.';
    else if (_bmi<25 && _bmi>18)
      return 'Good Work';
    else
      return 'Try eating more.';
  }

}