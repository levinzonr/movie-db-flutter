import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';

class OnboardingItem extends StatelessWidget {

  final String title;
  final String message;
  final Widget child;

  OnboardingItem({this.title, this.child, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 1,child: child),
          Flexible(flex: 1,child: _labelView),

        ],
      ),
    );
  }

  Widget get  _labelView {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyles.header2,),
        Text(message, style: TextStyles.body2,)
      ],
    );
  }
}
