import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/get_preview_list_interactor.dart';
import 'package:what_and_where/presentation/screens/explore/explore_content_list_preview_event.dart';
import 'package:what_and_where/presentation/screens/explore/explore_content_list_preview_state.dart';

class ContentPreviewListBloc
    extends Bloc<ContentPreviewListEvent, ContentPreviewListState> {
  final GetVideoContentFirstPageInteractor getVideoContentFirstPageInteractor;

  ContentPreviewListBloc(this.getVideoContentFirstPageInteractor);

  @override
  ContentPreviewListState get initialState => Default();

  @override
  Stream<ContentPreviewListState> mapEventToState(ContentPreviewListEvent event) async* {
    if (event is Init) {
      final result = await getVideoContentFirstPageInteractor.execute(event.type);
      if (result != null) {
        yield ContentPreviewListLoaded(result);
      }
    }
  }
}
