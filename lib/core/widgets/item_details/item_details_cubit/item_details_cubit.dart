import 'package:bloc/bloc.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:equatable/equatable.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  final Product item;

  ItemDetailsCubit(this.item) : super(ItemDetailsStateInitial());
}
