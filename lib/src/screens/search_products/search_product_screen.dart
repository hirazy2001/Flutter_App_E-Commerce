import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/helper/speech_api.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchProductScreen extends StatefulWidget {
  static const String routeName = "/searchProduct";

  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  SearchProductScreenState createState() {
    return SearchProductScreenState();
  }
}

class SearchProductScreenState extends State<SearchProductScreen> {
  String text = "";
  var focusNode = FocusNode();
  bool isListening = false;

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
                  width: 15,
                  height: 15,
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
                  border: Border.all(color: Colors.red, width: 2)),
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    autofocus: true,
                    focusNode: focusNode,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    decoration: const InputDecoration(
                        hintText: "Hoho", border: InputBorder.none),
                  )),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      child: Image.asset(
                        "assets/images/ic_camera.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  )
                ],
              ),
            )),
            const SizedBox(
              width: 5,
            ),
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
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        backgroundColor: Colors.black38,
                        label: Text('Item $index'),
                        selected: false,
                        onSelected: (value) {},
                      );
                    }),
                  )
                ],
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: InkWell(
                  onTap: () async {
                    toggleRecording();
                    // requestPermission();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 224, 148, 56),
                          Color.fromARGB(255, 161, 22, 106),
                          Color.fromARGB(255, 177, 1, 42),
                        ])),
                    child: Row(
                      children: const [
                        Text(
                          "Search by speech",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ))
      ],
    )));
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) {
        print("Text $text");
        setState(() {
          this.text = text;
        });
      },
      isListening: (value){
        setState((){
          isListening = value;
        });
      });

  Future<void> requestPermission() async {
    if (await Permission.speech.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
