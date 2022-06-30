import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/constants.dart';

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
      body: Markdown(
        data: Constants.FILE_HTML_PRODUCT,
        onTapLink: (text, href, title) {
          launchUrl(Uri.parse(href!));
        },
      ),
    );
  }
}
