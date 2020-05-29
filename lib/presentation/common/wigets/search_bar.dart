
import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';
import 'package:what_and_where/presentation/translations/translations.dart';

class SearchBar extends StatelessWidget {


  final Function(String) onChanged;

  SearchBar({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(4),
        color: AppColors.transparentDark,
        child: TextField(
          decoration: _textFieldDecoration,
          onChanged: onChanged,
        ),
      ),
    );
  }

  InputDecoration get _textFieldDecoration {
    return InputDecoration(
      hintText: Translation.searchHint,
      prefixIcon: Icon(Icons.search),
      border: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none
    );
  }
}