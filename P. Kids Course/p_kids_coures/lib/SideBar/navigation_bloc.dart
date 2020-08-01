import 'package:bloc/bloc.dart';
import 'package:pkidscoures/TeacherView/PageManager.dart';

enum NavigationEvents {
  PageManagerClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => PageManagerView();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {

      case NavigationEvents.PageManagerClickedEvent:
        yield PageManagerView();
        break;
    }
  }
}