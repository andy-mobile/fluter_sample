import 'package:flutter/material.dart';

enum PriceColor {
  gray(Colors.grey),
  green(Colors.green),
  red(Colors.red);

  final Color value;

  const PriceColor(this.value);
}
