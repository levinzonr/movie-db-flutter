

import 'package:flutter/material.dart';

class MyAppBar extends AppBar {

  MyAppBar(BuildContext context) : super(
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: Text("App Bar"),
  );


}