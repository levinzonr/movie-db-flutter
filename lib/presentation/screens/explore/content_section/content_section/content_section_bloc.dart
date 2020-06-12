import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/get_content_page_by_type_Interactor.dart';
import 'package:what_and_where/utils/logger.dart';
import 'content_section_extras.dart';

class ContentSectionBloc extends Bloc<ContentSectionEvent, ContentSectionState> {

  final GetContentPageByTypeInteractor getContentPageByTypeInteractor;
  ContentSectionBloc(this.getContentPageByTypeInteractor);

  @override
  ContentSectionState get initialState => ContentSectionState(data: []);

  @override
  Stream<ContentSectionState> mapEventToState(ContentSectionEvent event) async* {
    if (event is Init) {
      final input = GetContentPageByTypeInteractorInput(event.type, 0);
      final result = await getContentPageByTypeInteractor.execute(input);
      logger.d("Result: $result");
      if (result != null) {
        yield ContentSectionState(data: result.data);
      } else {
      }
    }
  }

}
