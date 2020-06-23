import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';

class AppButton extends MaterialButton {

  final String label;
  final VoidCallback onPressed;

  AppButton(this.label, {@required this.onPressed}) : super(
    onPressed: onPressed,
    child: Container(height: 56, alignment: Alignment.center, padding: EdgeInsets.all(16), width: double.infinity,child: Text(label, style: TextStyles.button)),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

}
