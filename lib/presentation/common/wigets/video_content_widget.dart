import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/video_content.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';

class VideoContentWidget extends StatelessWidget {
  final VideoContent content;
  final VoidCallback onTap;

  VideoContentWidget({this.content, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: 150,
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

  Widget get _imageRow => SizedBox(
          child: Container(
        height: double.infinity,
        width: 100,
        child: Stack(
          children: <Widget>[
            Image.asset(content.posterImageUrl, fit: BoxFit.fill, height: double.infinity),
            _ratingRow
          ],
        ),
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
            ],
          ),
        ],
      ));

  Widget get _descriptionColumn => Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${content.title} (${content.releaseDate.year})",
                style: TextStyles.header2,
              )),
        ],
      );

  Widget get _dateColumn => Row(
        children: <Widget>[
          Icon(Icons.calendar_today),
          Text(content.releaseDate.year.toString())
        ],
      );

  Widget get _ratingRow => ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child:  Container(
     alignment: Alignment.center,
      color: content.voteAverage.ratingColor,
      width: 30,
      height: 30,
      child: Text(
        content.voteAverage.toString(),
        style: TextStyles.body1.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ))
  );

}
