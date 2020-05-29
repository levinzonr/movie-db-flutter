

import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/translations/translations.dart';

class MovieDetailsView extends StatelessWidget {

  final String description;
  MovieDetailsView({this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(child: Text(Translation.synopsis, style: TextStyles.header2,),),
        Padding(padding: EdgeInsets.only(top: 8),),
        Container(child: Text(description, style: TextStyles.body1,),)
      ],
    );
  }
}