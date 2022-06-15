import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/tab_page/tab_page_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/tab_page/tab_page_state.dart';

class TabPageBloc extends Bloc<TabPageEvent, TabPageState> {
  TabPageBloc() : super(const TabPageState(index: 0)) {
    on<ChangeTabEvent>(_changeTab);
  }

  void _changeTab(ChangeTabEvent event, Emitter<TabPageState> emitter) {
    int _index = event.newIndex;
    emitter(state.copyWith(index: _index));
  }
}
