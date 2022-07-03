import 'package:equatable/equatable.dart';

import '../../data/model/room.dart';

 class ChatState extends Equatable{
  @override
  List<Object?> get props => [];

}

class ChatLoadingState extends ChatState{

}

class ChatLoadFailed extends ChatState{

}

class ChatLoaded extends ChatState{
   Room room;

   ChatLoaded({required this.room});
}