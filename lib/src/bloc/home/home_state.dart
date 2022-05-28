import 'package:equatable/equatable.dart';

class HomeState extends Equatable{
  const HomeState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends HomeState{
  const LoadingState();
}

class HomeRefreshFailedState extends HomeState{
  const HomeRefreshFailedState();
}

class HomeRefreshSuccessState extends HomeState{
  const HomeRefreshSuccessState();
}

