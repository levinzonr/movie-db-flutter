

import 'package:flutter/material.dart';

class MyAppBar extends AppBar {

  MyAppBar() : super(
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    centerTitle: true,
    title: Text("App Bar"),
  );

}