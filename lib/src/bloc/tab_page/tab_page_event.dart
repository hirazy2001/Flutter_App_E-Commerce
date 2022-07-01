import 'package:equatable/equatable.dart';

class TabPageEvent extends Equatable{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class BackHomeEvent extends TabPageEvent{

}

class ChangeTabEvent extends TabPageEvent{
  int newIndex;

  ChangeTabEvent({required this.newIndex});
}