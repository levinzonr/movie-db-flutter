import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/video_content.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';

class TopRatedMovieWidget extends StatelessWidget {
  final VideoContent content;
  final VoidCallback onTap;

  TopRatedMovieWidget({this.content, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: 200,
          child: Card(
            elevation: 16,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: <Widget>[
                _imageRow,
                _detailsRow,
              ],
            ),
          )),
    );
  }

  Widget get _imageRow => Flexible(
      flex: 4,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child:  Image.asset(content.posterImageUrl, fit: BoxFit.fill),
      ));

  Widget get _detailsRow => Flexible(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: _descriptionColumn),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 8)),
              _ratingRow
            ],
          ),
        ],
      ));

  Widget get _descriptionColumn => Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${content.title} (${content.releaseDate})",
                style: TextStyles.header1,
              )),
          Padding(padding: EdgeInsets.only(top: 8)),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Genres",
              style: TextStyles.body1,
            ),
          ),
        ],
      );

  Widget get _ratingRow => Container(
        padding: EdgeInsets.only(right: 16, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(
              content.voteAverage.toString(),
              style: TextStyles.body1,
            )
          ],
        ),
      );

}
