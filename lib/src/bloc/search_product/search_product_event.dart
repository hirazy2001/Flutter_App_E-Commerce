import 'package:equatable/equatable.dart';

class SearchProductEvent extends Equatable{

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchProductSuggestion extends SearchProductEvent{
  String keyword;

  SearchProductSuggestion({required this.keyword});
}

