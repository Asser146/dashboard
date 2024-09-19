import 'package:bloc/bloc.dart';
import 'package:dashboard/core/widgets/item_card_list/items_list_operations.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:equatable/equatable.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState>
    with ItemsListOperations {
  final Product item;

  ItemDetailsCubit(this.item) : super(ItemDetailsStateInitial()) {
    detailsInit();
  }

  Future<void> detailsInit() async {
    init();
    emit(ItemDetailsStateItems(
        items: items, fav: isFav(item), cart: isCart(item)));
  }

  Future<void> toggleDetailsFavourite(Product item) async {
    emit(ItemDetailsStateLoading());
    await toggleFavourite(item);
    emit(ItemDetailsStateItems(
        items: items, fav: isFav(item), cart: isCart(item)));
  }

  Future<void> toggleDetailsCart(Product item, int direction) async {
    emit(ItemDetailsStateLoading());
    await toggleCart(item, direction);
    emit(ItemDetailsStateItems(
        items: items, fav: isFav(item), cart: isCart(item)));
  }

  bool isDetailsFavourite(Product item) {
    emit(ItemDetailsStateLoading());
    return isFav(item);
  }

  bool isDetailsCart(Product item) {
    emit(ItemDetailsStateLoading());
    return isCart(item);
  }

  void toggleQuantity(Product item, int direction) {
    toggleCart(item, direction);
    emit(ItemDetailsStateItems(
        items: items, fav: isFav(item), cart: isCart(item)));
  }

  int getDetailsQuantity(int itemId) {
    return getQuantity(itemId);
  }
}
