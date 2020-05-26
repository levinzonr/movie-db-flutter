import 'package:flutter/material.dart';
import 'package:what_and_where/injection/bloc_module.dart' as blocModule;
import 'package:what_and_where/injection/repository_module.dart' as repositoryModule;
import 'package:what_and_where/injection/interactor_module.dart' as interactorModule;
import 'app.dart';

void main() async {

  await repositoryModule.inject();
  await interactorModule.inject();
  await blocModule.inject();

  runApp(MyApp());
}

