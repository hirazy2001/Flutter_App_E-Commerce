import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  final String roomId;

  static const String routeName = '/chatScreen';

  const ChatScreen({Key? key, required this.roomId}) : super(key: key);

  @override
  ChatScreenState createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

  @override
  void deactivate(){
    super.deactivate();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Image(
                  image: AssetImage("assets/images/ic_back.png"),
                ),
              ),
              Expanded(
                  child: Column(
                children: const [
                  Text(
                    "Hirazy",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  Text(
                    "Online 2 hours",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 13),
                  )
                ],
              )),
              GestureDetector(
                onTap: (){

                },
                child: const Image(
                  image: AssetImage(
                    "assets/images/"
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: const Image(
                    image: AssetImage(
                        "assets/images/ic_back.png"
                    ),
                  )
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
