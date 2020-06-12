import 'dart:async';
import 'package:bloc/bloc.dart';
import 'content_section_extras.dart';

class ContentSectionBloc
    extends Bloc<ContentSectionEvent, ContentSectionState> {

  @override
  ContentSectionState get initialState => ContentSectionState();

  @override
  Stream<ContentSectionState> mapEventToState(ContentSectionEvent event) async* {

  }

}
