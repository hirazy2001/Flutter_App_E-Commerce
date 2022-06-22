import 'package:equatable/equatable.dart';
import 'package:flutter_app_e_commerce/src/data/model/message.dart';

class ChatEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ChatLoading extends ChatEvent{

}

class SendMessage extends ChatEvent{
  Message message;

  SendMessage({required this.message});
}

