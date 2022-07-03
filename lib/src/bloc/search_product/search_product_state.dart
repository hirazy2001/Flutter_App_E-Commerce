import 'package:equatable/equatable.dart';

class SearchProductState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchLoadingState extends SearchProductState {

}

class SearchSuggestion extends SearchProductState{
  List<String> suggestions;

  SearchSuggestion({required this.suggestions});
}

class SearchSuccessfulState extends SearchProductState {

}

class SearchErrorState extends SearchProductState {

}
