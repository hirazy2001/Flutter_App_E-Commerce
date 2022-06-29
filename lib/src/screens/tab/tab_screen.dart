import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/tab_page/tab_page_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/tab_page/tab_page_state.dart';
import 'package:flutter_app_e_commerce/src/screens/tab/account/account_widget.dart';
import 'package:flutter_app_e_commerce/src/screens/tab/cart/my_carts_widget.dart';
import 'package:flutter_app_e_commerce/src/screens/tab/chat/chat_widget.dart';
import 'package:flutter_app_e_commerce/src/screens/tab/home/home_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/tab_page/tab_page_bloc.dart';
import '../../widgets/bottom_navigation_app.dart';

class TabScreen extends StatefulWidget {
  static const String routeName = "/tab";

  @override
  TabScreenState createState() {
    return TabScreenState();
  }
}

class TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabPageBloc>(
      create: (context) => TabPageBloc(),
      child: BlocConsumer<TabPageBloc, TabPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: _body(state, context),
            bottomNavigationBar: _bottomNavigationBar(state, context),
          );
        },
      ),
    );
  }

  Widget _body(TabPageState state, BuildContext context) {
    return IndexedStack(
      index: state.index,
      children: [HomeWidget(), ChatWidget(), MyCartsWidget(), AccountWidget()],
    );
  }

  Widget _bottomNavigationBar(TabPageState state, BuildContext context) {
    return BottomNavigationApp(
      currentIndex: state.index,
      onClick: (index) {
        context.read<TabPageBloc>().add(ChangeTabEvent(newIndex: index));
      },
    );
  }
}
