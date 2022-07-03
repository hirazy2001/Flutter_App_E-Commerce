import 'package:equatable/equatable.dart';
import 'package:flutter_app_e_commerce/src/data/model/message.dart';

import '../../data/model/shop_view.dart';

class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatInit extends ChatEvent {
  ShopView shopView;

  ChatInit({required this.shopView});
}

class ChatLoading extends ChatEvent {}

class SendMessage extends ChatEvent {
  Message message;

  SendMessage({required this.message});
}
