

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/models/video_content.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class SearchContentInteractor extends Interactor<String, Page<VideoContent>> {

  final MovieRepository _repository;
  SearchContentInteractor(this._repository);

  @override
  Future<Page<VideoContent>> execute([String input]) async {
    return await _repository.searchContent(input).then((value) {
      return value;
    }).catchError((error) {
      logger.d("Error: $error");
      return null;
    });
  }
}