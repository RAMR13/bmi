import 'package:flutter/material.dart';
import 'dart:math';

class Brain {
  Brain({required this.weight, required this.height});

  final int weight;
  final int height;
  late double _bmi;
  void pa() {
    print(_bmi);
  }

  String bmicalc() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getres() {
    String res = ' ';
    if (_bmi >= 25)
      res = 'Overweight';
    else if (_bmi >= 18.5)
      res = 'Normal';
    else if (_bmi < 18.5) res = 'underweight';
    return res;
  }
}
