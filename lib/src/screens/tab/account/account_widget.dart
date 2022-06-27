import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatefulWidget {
  @override
  AccountWidgetState createState() {
    return AccountWidgetState();
  }
}

class AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [SliverAppBar()],
    ));
  }
}
