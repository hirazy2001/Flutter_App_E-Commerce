import 'package:flutter/material.dart';

class SearchProductScreen extends StatefulWidget {

  static const String routeName = "/searchProduct";

  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  SearchProductScreenState createState() {
    return SearchProductScreenState();
  }
}

class SearchProductScreenState extends State<SearchProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

      ),
    );
  }
}
