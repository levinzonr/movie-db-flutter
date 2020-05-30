
import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';

class SettingsButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;


  const SettingsButton({
    Key key,
    @required this.text,
    @required this.onTap
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.blackish, border: Border.all(color: Theme.of(context).accentColor, width: 0.3)),
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(text, style: TextStyles.button,),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}