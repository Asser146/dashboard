part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoadingMore extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Product> items;

  const SearchLoaded({required this.items});

  @override
  List<Object> get props => [items];
}

class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});

  @override
  List<Object> get props => [message];
}
