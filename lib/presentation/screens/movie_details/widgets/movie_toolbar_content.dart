import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';

class MovieToolbarContent extends StatelessWidget {

  final String posterImageUrl;
  final String backgroundImageUrl;
  final String title;
  final String subtitle;

  MovieToolbarContent(
      {this.posterImageUrl, this.backgroundImageUrl, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(backgroundImageUrl, fit: BoxFit.fill,),
        _toolbarGradient,
        _movieDetailsContent,
      ],
    );
  }

  Widget get _toolbarGradient =>
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [0.0, 0.2, 1.0],
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.black, Colors.transparent])),
      );

  Widget get _movieDetailsContent =>
      Container(
        padding: EdgeInsets.only(left: 16),
        alignment: Alignment.bottomLeft,
        child:
        FractionallySizedBox(
          alignment: Alignment.bottomLeft,
          heightFactor: 0.5,
          child: _posterRow,
        ),
      );


  Widget get _posterRow =>
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(posterImageUrl, fit: BoxFit.fitHeight,),
            ),
            Padding(padding: EdgeInsets.only(left: 16, bottom: 16)),
            Expanded(child: _movieNameTitle)
          ]
      );


  Widget get _movieNameTitle =>
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyles.header1,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          Text(subtitle, style: TextStyles.body1,),
          Padding(padding: EdgeInsets.symmetric(vertical: 8))
        ],
      );


}