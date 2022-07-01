import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/tab_page/tab_page_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/tab_page/tab_page_state.dart';

class TabPageBloc extends Bloc<TabPageEvent, TabPageState> {
  TabPageBloc() : super(const TabPageState(index: 0)) {
    on<ChangeTabEvent>(_changeTab);
    on<BackHomeEvent>(_backHome);
  }

  void _backHome(BackHomeEvent event, Emitter<TabPageState> emitter) {
    emitter(state.copyWith(index: 0));
  }

  void _changeTab(ChangeTabEvent event, Emitter<TabPageState> emitter) {
    int _index = event.newIndex;
    emitter(state.copyWith(index: _index));
  }
}
