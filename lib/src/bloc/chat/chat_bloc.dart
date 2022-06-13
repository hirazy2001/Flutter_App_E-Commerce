import 'package:bloc/bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/chat/chat_event.dart';
import 'package:flutter_app_e_commerce/src/bloc/chat/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(ChatState initialState) : super(initialState);

}
