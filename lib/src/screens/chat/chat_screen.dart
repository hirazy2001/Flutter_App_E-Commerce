import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/chat/chat_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/chat/chat_state.dart';
import 'package:flutter_app_e_commerce/src/data/model/shop_view.dart';
import 'package:flutter_app_e_commerce/src/widgets/chat/item_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/chat/chat_event.dart';
import '../../common/constants.dart';
import '../../data/model/message.dart';

class ChatScreen extends StatefulWidget {
  final ShopView shop;

  static const String routeName = '/chatScreen';

  const ChatScreen({Key? key, required this.shop}) : super(key: key);

  @override
  ChatScreenState createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController animationController;
  late ExpandableController expandableController;
  late TextEditingController editingController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    expandableController = ExpandableController();
    editingController = TextEditingController();
    animationController.forward();

    // animationController.forward().then((value) async {
    //   // await Future.delayed(const Duration(seconds: 1));
    //   // animationController.reverse();
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      create: (context) => ChatBloc()..add(ChatInit(shopView: widget.shop)),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          // if (state is ChatLoaded) {
          return SafeArea(
              child: Scaffold(
            body: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Image(
                        width: 20,
                        height: 20,
                        image: AssetImage("assets/images/ic_back.png"),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        const Image(
                            width: 20,
                            height: 20,
                            image: NetworkImage(Constants.urlAvatar)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        )
                      ],
                    )),
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/ic_menu.png",
                          width: 25,
                          height: 25,
                        )),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 1,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return ItemMessage(
                        message: Message(content: '', roomId: '', senderId: ''),
                        onClick: () {});
                  },
                )),
                ExpandableNotifier(
                  child: Expandable(
                      controller: expandableController,
                      collapsed: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: IconButton(
                                iconSize: 25,
                                onPressed: onToggle,
                                icon: AnimatedIcon(
                                    icon: AnimatedIcons.add_event,
                                    progress: animationController)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      border: Border.all(
                                          color: Colors.white12, width: 1)),
                                  child: Row(children: [
                                    Expanded(
                                        child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Chatting...",
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.white12,
                                              fontSize: 15)),
                                      controller: editingController,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )),
                                    IconButton(
                                        iconSize: 25,
                                        onPressed: () {},
                                        icon: const Icon(Icons.tag_faces))
                                  ])))
                        ],
                      ),
                      expanded: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  iconSize: 30,
                                  onPressed: onToggle,
                                  icon: AnimatedIcon(
                                      icon: AnimatedIcons.add_event,
                                      progress: animationController)),
                              Expanded(child: TextField())
                            ],
                          ),
                          Container(
                            child: Image.network(
                              Constants.urlAvatar,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ));
          // }
          // return Container(
          //   child: Text("Loading"),
          // );
        },
      ),
    );
  }

  void onToggle() => setState(() {
        isExpanded = !isExpanded;
        isExpanded
            ? animationController.forward()
            : animationController.reverse();
        expandableController.toggle();
      });
}
