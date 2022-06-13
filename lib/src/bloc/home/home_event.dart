import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class HomeRefreshEvent extends HomeEvent{

  @override
  List<Object?> get props => [];
}

class DetailProductEvent extends HomeEvent{
  final String productId;

  DetailProductEvent({required this.productId});
}
