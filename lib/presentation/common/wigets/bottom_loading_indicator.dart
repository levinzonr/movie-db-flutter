

import 'package:flutter/material.dart';

class CenteredLoadingIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}