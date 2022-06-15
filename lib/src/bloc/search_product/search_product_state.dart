import 'package:equatable/equatable.dart';

class SearchProductState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchLoadingState extends SearchProductState {

}

class SearchSuccessfulState extends SearchProductState {}

class SearchErrorState extends SearchProductState {}
