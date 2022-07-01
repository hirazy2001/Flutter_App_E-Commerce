import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hive/hive.dart';
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
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Row(
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/back.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.red, width: 2)
                  ),
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(hintText: "Hoho"),
                  )),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset("assets/images/ic_camera.png",
                        width: 20,
                        height: 20,),
                    ),
                  )
                ],
              ),
            )),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 224, 148, 56),
                      Color.fromARGB(255, 161, 22, 106),
                      Color.fromARGB(255, 177, 1, 42),
                    ])),
                child: const Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Search Suggestion",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              Wrap(
                children: List.generate(4, (index) {
                  return ChoiceChip(
                    label: Text('Item $index'),
                    selected: false,
                    onSelected: (value) {},
                  );
                }),
              )
            ],
          ),
        )
      ],
    )));
  }
}
