

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/domain/models/video_content.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class GetVideoContentFirstPageInteractor extends Interactor<ExploreContentType, List<VideoContent>> {


  final MovieRepository repository;
  GetVideoContentFirstPageInteractor(this.repository);

  @override
  Future<List<VideoContent>> execute([ExploreContentType input]) async {
    return repository.getTopRatedMoviesPage(0).then((value) {
      return value.data;
    }).catchError((error) {
      logger.d("error: $error");
      return null;
    });
  }
}