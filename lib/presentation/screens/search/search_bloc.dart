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
  SearchBloc(this._searchContentInteractor);

  CancelableOperation<Page<VideoContent>> searchOperation;


  @override
  SearchState get initialState => Default();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    final currentState = state;
    if (event is SearchQueryUpdated) {
      logger.d("new query : ${event.newQuery}");
      yield ContentLoading(state.query);
      searchOperation?.cancel();
      searchOperation = newSearchJob(event.newQuery);
      searchOperation?.valueOrCancellation()?.then((value) {
        if (value != null) {
          add(ContentLoaded(value.data));
        }
      });
    } else if (event is ContentLoaded) {
        yield ContentLoadedSuccess(event.content, currentState.query);
    }
  }

  CancelableOperation<Page<VideoContent>> newSearchJob(String query) {
    return CancelableOperation.fromFuture(
        Future.delayed(Duration(seconds: 1), () => _searchContentInteractor.execute(query)),
        onCancel: () => logger.d("Cancel query"));
  }
}
