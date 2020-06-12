

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/models/video_content.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class GetContentPageByTypeInteractorInput {
  final ExploreContentType type;
  final int page;
  GetContentPageByTypeInteractorInput(this.type, this.page);
}

class GetContentPageByTypeInteractor extends Interactor<GetContentPageByTypeInteractorInput, Page<VideoContent>> {

  final MovieRepository repository;
  GetContentPageByTypeInteractor(this.repository);

  @override
  Future<Page<VideoContent>> execute([GetContentPageByTypeInteractorInput input]) async {
    return repository.getTopRatedMoviesPage(input.page).then((value) {
      logger.e("Page Loaded: $value");
      return value;
    }).catchError((error) {
      logger.e("Error: $error");
      return null;
    });

  }
}