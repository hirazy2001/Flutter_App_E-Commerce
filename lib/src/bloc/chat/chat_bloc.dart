import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/chat/chat_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/chat/chat_state.dart';
import 'package:flutter_app_e_commerce/src/data/model/shop_view.dart';

import '../../data/model/message.dart';
import '../../data/model/room.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late Room _room;

  ChatBloc() : super(ChatState()) {
    on<ChatInit>(loadRoom);
  }

  Future<void> loadRoom(ChatInit event, Emitter<ChatState> emitter) async {
    // _room = Room(id: "", messages: messages, shopView: shopView, userLocal: userLocal)
    _room.shopView = event.shopView;

    emitter(ChatLoaded(room: _room));
  }
}
