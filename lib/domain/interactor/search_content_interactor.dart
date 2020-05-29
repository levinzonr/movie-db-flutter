

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/models/video_content.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class SearchContentInteractorInput {
  final String query;
  final int page;
  SearchContentInteractorInput({this.query, this.page});
}

class SearchContentInteractor extends Interactor<SearchContentInteractorInput, Page<VideoContent>> {

  final MovieRepository _repository;
  SearchContentInteractor(this._repository);

  @override
  Future<Page<VideoContent>> execute([SearchContentInteractorInput input]) async {
    return await _repository.searchContent(input.query, input.page).then((value) {
      return value;
    }).catchError((error) {
      logger.d("Error: $error");
      return null;
    });
  }
}