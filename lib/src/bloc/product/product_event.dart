import 'package:equatable/equatable.dart';

class ProductEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProductLoadingEvent extends ProductEvent{

}

class ProductLoadMoreEvent extends ProductEvent{

}