import 'package:flutter/material.dart';
import 'dart:math';

double pmiCalculation(double height, double weight) {
  double base = (height / 100);
  return weight / pow(base, 2);
}
