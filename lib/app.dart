import 'package:deriv/core/app.dart';
import 'package:flutter/material.dart';
import 'package:deriv/core/di/injector_provider.dart';

void main() async {
  setupInjection();
  runApp(App());
}