import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:dashboard/features/main_screen/domain/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final List<String> categories = [], slugs = [];
  int currentTabIndex = 0;
  int skip = 0, limit = 10;
  final scrollController = ScrollController();
  final ProductRepository repo;
  bool isLoading = false, isDone = false;
  List<Product> allItems = [], categoryProducts = [];

  HomeCubit(this.repo) : super(HomeStateInitial());

  Future<void> homeInit() async {
    try {
      allItems = await repo.getProducts(limit.toString(), skip.toString());
      final List<List<String>> cat = await repo.getCategories();
      categories.addAll(cat[0]);
      slugs.addAll(cat[1]);
      categories.insert(0, 'All');
      categoryProducts = allItems;
      emit(HomeStateItems(items: categoryProducts));
    } catch (e) {
      emit(HomeStateError(error: e.toString()));
    }
    setUpScrollListener();
  }

  void setUpScrollListener() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await loadMoreProducts();
      }
    });
  }

  Future<void> loadMoreProducts() async {
    isLoading = true;
    try {
      emit(HomeStateLoadingMore()); // Emit loading more state
      skip += limit;

      List<Product> newItems;
      if (currentTabIndex == 0) {
        newItems = await repo.getProducts(limit.toString(), skip.toString());
      } else {
        newItems = await repo.getCategoryProducts(slugs[currentTabIndex - 1],
            limit.toString(), categoryProducts.length.toString());
      }

      if (newItems.isNotEmpty) {
        isDone = false;
        if (currentTabIndex == 0) {
          allItems.addAll(newItems);
          categoryProducts = allItems;
        } else {
          categoryProducts.addAll(newItems);
        }
        emit(HomeStateItems(items: categoryProducts));
      } else {
        isDone = true;
        emit(HomeStateNoMoreItems(items: categoryProducts));
      }
    } catch (e) {
      emit(HomeStateError(error: e.toString()));
    }
    isLoading = false;
  }

  void changeTab(int index) async {
    isDone = false;
    currentTabIndex = index;
    emit(HomeStateTabChanged(index: index));

    try {
      emit(HomeStateLoading()); // Show loading when changing tabs

      if (currentTabIndex == 0) {
        categoryProducts = allItems;
        emit(HomeStateItems(items: categoryProducts));
      } else {
        skip = 0;
        String category = slugs[currentTabIndex - 1];
        categoryProducts = await repo.getCategoryProducts(
            category, limit.toString(), skip.toString());
        emit(HomeStateItems(
            items: categoryProducts)); // Emit products for the category
      }
    } catch (e) {
      emit(HomeStateError(error: e.toString()));
    }
  }
}
