import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/search_content_interactor.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/models/video_content.dart';
import 'package:what_and_where/presentation/screens/search/search_event.dart';
import 'package:what_and_where/presentation/screens/search/search_state.dart';
import 'package:what_and_where/utils/logger.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final SearchContentInteractor _searchContentInteractor;
  int _nextPageToLoad;
  bool hasMore;
  bool isLoadingNextPage;


  SearchBloc(this._searchContentInteractor);

  CancelableOperation<Page<VideoContent>> searchOperation;



  @override
  SearchState get initialState => Default();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    final currentState = state;
    logger.d("Event: $event, state:$currentState");
    if (event is SearchQueryUpdated) {
      if (event.newQuery.isEmpty) {
        searchOperation?.cancel();
        isLoadingNextPage = false;
        yield Default();
      } else {
        yield ContentLoading(state.query);
        searchOperation?.cancel();
        isLoadingNextPage = true;
        searchOperation = newSearchJob(event.newQuery, 0);
        searchOperation?.valueOrCancellation()?.then((value) {
          if (value != null) {
            _nextPageToLoad = value.nextPage;
            add(ContentLoaded(value));
          }
        });
      }
    } else if (event is ContentLoaded) {
        isLoadingNextPage = false;
        hasMore = event.content.hasMore;
        yield ContentLoadedSuccess(event.content.data, currentState.query, event.content.hasMore);
    } else if (event is LoadNext) {
      isLoadingNextPage = true;
      final input = SearchContentInteractorInput(query: state.query, page: _nextPageToLoad);
      final result = await _searchContentInteractor.execute(input);
      if (result != null && currentState is ContentLoadedSuccess) {
        logger.d("Loaded");
        hasMore = result.hasMore;
        isLoadingNextPage = false;
        yield ContentLoadedSuccess(currentState.content + result.data, state.query, result.hasMore);
      }
    }
  }


  CancelableOperation<Page<VideoContent>> newSearchJob(String query, int page) {
    final input = SearchContentInteractorInput(query: query, page: page);
    return CancelableOperation.fromFuture(
        Future.delayed(Duration(seconds: 1), () => _searchContentInteractor.execute(input)),
        onCancel: () => logger.d("Cancel query"));
  }
}
