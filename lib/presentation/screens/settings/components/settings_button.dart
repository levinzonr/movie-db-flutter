import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final String value;
  final VoidCallback onTap;

  const SettingsButton(
      {Key key,
      @required this.text,
      @required this.onTap,
      @required this.icon,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.almostBlack),
          width: double.infinity,
          child: _stack,
        ),
      ),
    );
  }

  Widget get _stack {
    return Stack(
      children: <Widget>[
        Align(alignment: Alignment.centerLeft,child: _content),
        Positioned(
          left: -20,
          child: ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              heightFactor: 0.5,
              child: Opacity(opacity: 0.07,child: Icon(icon, size: 150)),
            ),
          ),
        )
      ],
    );
  }

  Widget get _content {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(text, style: TextStyles.button,),
              ),
             if (value != null) Container(
               child: Text(
                      value ?? "NULL",
                      style: TextStyles.body1,
                    ),
             )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.chevron_right),
        )
      ],
    );
  }
}
