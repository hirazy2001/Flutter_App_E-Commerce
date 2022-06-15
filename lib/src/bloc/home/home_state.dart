import 'package:equatable/equatable.dart';

class HomeState extends Equatable{
  const HomeState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends HomeState{
  const LoadingState();
}

class HomeLoadFailedState extends HomeState{
  const HomeLoadFailedState();
}

class HomeLoadSuccessState extends HomeState{
  const HomeLoadSuccessState();
}

