import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/get_content_page_by_type_Interactor.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/utils/logger.dart';
import 'content_section_extras.dart';

class ContentSectionBloc extends Bloc<ContentSectionEvent, ContentSectionState> {

  final GetContentPageByTypeInteractor getContentPageByTypeInteractor;
  ContentSectionBloc(this.getContentPageByTypeInteractor);

  int _nextPageToLoad = -1;
  ExploreContentType type;

  bool hasMore = true;

  @override
  ContentSectionState get initialState => ContentSectionState(data: []);

  @override
  Stream<ContentSectionState> mapEventToState(ContentSectionEvent event) async* {
    logger.d("Event: $event");
    if (event is Init) {
      type = event.type;
      final input = GetContentPageByTypeInteractorInput(event.type, 0);
      yield state.copyWith(loadingNext: true);
      final result = await getContentPageByTypeInteractor.execute(input);
      logger.d("Result: $result");
      if (result != null) {
        hasMore = result.hasMore;
        _nextPageToLoad = result.nextPage;
        yield ContentSectionState(data: result.data, isLoadingNext: false);
      } else {
      }
    } else if (event is LoadNext && !state.isLoadingNext && hasMore) {
      final input = GetContentPageByTypeInteractorInput(type, _nextPageToLoad);
      yield state.copyWith(loadingNext: true);
      final result = await getContentPageByTypeInteractor.execute(input);
      if (result != null) {
        hasMore = result.hasMore;
        _nextPageToLoad = result.nextPage;
        yield ContentSectionState(data: state.data + result.data, isLoadingNext: false);
      }
    }
  }

}
