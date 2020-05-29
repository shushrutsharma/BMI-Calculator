import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});
  final int height;
  final int weight;
  double _bmi;  

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

    String getComment() {
    if (_bmi >= 25) {
      return 'You should be exercising more, while maintaining a proper balanced diet!';
    } else if (_bmi > 18.5) {
      return 'Very good. You\'re BMI is perfect Stay Healthy!';
    } else {
      return 'You should focus on gaining more weight in a healthy manner!';
    }
  }


}
