import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:dashboard/features/main_screen/domain/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final List<String> categories = ["ALL"];
  int currentTabIndex = 0;
  final ProductRepository repo;
  List<Product> allItems = [], categoryItems = [];

  HomeCubit(this.repo) : super(HomeStateInitial()) {
    homeInit();
  }

  Future<void> homeInit() async {
    try {
      allItems = await repo.getProducts(); // Fetch all products initially
      final List<String> cat = await repo.getCategories();
      categories.addAll(cat);
      categoryItems = allItems;
      emit(HomeStateItems(items: categoryItems));
    } catch (e) {
      // Handle error
      print('Error during initialization: $e');
      emit(HomeStateError(error: e.toString()));
    }
  }

  void changeTab(int index) async {
    currentTabIndex = index;
    emit(HomeStateTabChanged(index: index));
    try {
      if (currentTabIndex == 0) {
        categoryItems = allItems;
      } else {
        emit(HomeStateLoading());
        String category = categories[currentTabIndex];
        categoryItems = await repo.getCategoryProducts(category);
      }
      emit(HomeStateItems(items: categoryItems));
    } catch (e) {
      // Handle Dio error
      print('Error fetching category products: $e');
      emit(HomeStateError(error: e.toString()));
    }
  }
}
