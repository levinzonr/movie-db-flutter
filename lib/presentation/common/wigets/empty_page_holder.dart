import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';

class EmptyPageHolder extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget image;

  EmptyPageHolder(
      {@required this.title, @required this.subtitle, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: image,
            ),
            Padding(padding: EdgeInsets.only(top: 16),),
            Container(
              child: Text(
                title,
                style: TextStyles.header2,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 8),),
            Container(
              child: Text(
                subtitle,
                style: TextStyles.body2,
              ),
            )
          ],
        ));
  }
}
