import 'package:flutter/material.dart';
import 'package:what_and_where/injection/bloc_module.dart' as blocModule;
import 'app.dart';
void main() async {
  await blocModule.inject();
  runApp(MyApp());
}

