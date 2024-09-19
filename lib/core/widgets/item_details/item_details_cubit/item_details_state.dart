part of 'item_details_cubit.dart';

abstract class ItemDetailsState extends Equatable {
  const ItemDetailsState();

  @override
  List<Object> get props => [];
}

class ItemDetailsStateInitial extends ItemDetailsState {}

class ItemDetailsStateLoading extends ItemDetailsState {}

class ItemDetailsStateItems extends ItemDetailsState {
  final List<Product> items;
  const ItemDetailsStateItems({required this.items});

  @override
  List<Object> get props => [items];
}
