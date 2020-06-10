import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/video_content.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';

class VideoContentWidget extends StatelessWidget {
  final VideoContent content;
  final VoidCallback onTap;

  final double height;

  VideoContentWidget({this.content, this.onTap, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180, width: 110,
      child: Column(
        children: <Widget>[
          Expanded(flex: 8, child: _imageRow,),
          Expanded(flex: 2, child: _titleContainer,)
        ],
      ),
    );
  }

  Widget get _titleContainer => Container(
    padding: EdgeInsets.only(top: 4),
    child: Text(content.title,
      textAlign: TextAlign.start,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold, fontSize: 12)
    ),
  );

  Widget get _imageRow => Container(
    child : ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Stack(
      children: <Widget>[
        Image.asset(content.posterImageUrl, fit: BoxFit.fill, height: double.infinity, width: double.infinity,),
        _ratingRow
      ],
    )));


  Widget get _ratingRow => ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child:  Container(
     alignment: Alignment.center,
      color: content.voteAverage.ratingColor,
      width: 30,
      height: 30,
      child: Text(
        content.voteAverage.toString(),
        overflow: TextOverflow.fade,
        style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
      ))
  );

}

class child extends StatelessWidget {
  const child({
    Key key,
    @required Widget imageRow,
    @required Widget titleContainer,
  }) : _imageRow = imageRow, _titleContainer = titleContainer, super(key: key);

  final Widget _imageRow;
  final Widget _titleContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FractionallySizedBox(heightFactor: 0.8 ,child: _imageRow),
        FractionallySizedBox(
          heightFactor: 0.2,
          child: _titleContainer,
        )
      ],
    );
  }
}
