

abstract class VideoContent {
  final String id;
  final String title;
  final String posterImageUrl;
  final DateTime releaseDate;
  final double voteAverage;

  VideoContent({this.id, this.title, this.posterImageUrl, this.releaseDate, this.voteAverage});
}