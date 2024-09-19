part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateItems extends HomeState {
  final List<Product> items;
  const HomeStateItems({required this.items});

  @override
  List<Object> get props => [items];
}

class HomeStateTabChanged extends HomeState {
  final int index;
  const HomeStateTabChanged({required this.index});

  @override
  List<Object> get props => [index];
}

class HomeStateError extends HomeState {
  final String error;
  const HomeStateError({required this.error});

  @override
  List<Object> get props => [error];
}
