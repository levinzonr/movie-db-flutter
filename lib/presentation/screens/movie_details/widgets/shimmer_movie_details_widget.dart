

import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/common/wigets/shimmer_text_placeholder.dart';
import 'package:what_and_where/presentation/translations/translations.dart';

class ShimmerMovieDetailsWidget extends StatelessWidget {

  ShimmerMovieDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(child: Text(Translation.synopsis, style: TextStyles.header2,),),
        Padding(padding: EdgeInsets.only(top: 8),),
        Padding(padding: EdgeInsets.only(top: 4),),
        ShimmerTextPlaceHolder(),
        Padding(padding: EdgeInsets.only(top: 4),),
        ShimmerTextPlaceHolder(width: 200,)
      ],
    );
  }
}