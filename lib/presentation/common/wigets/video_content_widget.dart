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
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            _imageRow,
            Padding(padding: EdgeInsets.only(top: 7),),
            _titleContainer
          ],
        ),
      ) 
    );
  }

  Widget get _titleContainer => Flexible(
    child: Container(
      child: Text(content.title,

        textAlign: TextAlign.center,
        style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
        softWrap: true,),
    ),
  );

  Widget get _imageRow => Flexible(
    flex: 6,
       child: Container(
         padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
         child : ClipRRect(
         borderRadius: BorderRadius.circular(12),
         child: Container(
             height: double.infinity,
             child: Stack(
               children: <Widget>[
                 Image.asset(content.posterImageUrl, fit: BoxFit.fill, height: double.infinity, width: double.infinity,),
                 _ratingRow
               ],
             )
       ))),
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
