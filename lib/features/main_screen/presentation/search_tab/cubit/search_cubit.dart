import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:dashboard/features/main_screen/domain/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<Product> filteredItems = [];
  final ProductRepository repo;
  final scrollController = ScrollController();

  final PublishSubject<String> filterSubject = PublishSubject<String>();

  SearchCubit(this.repo) : super(SearchInitial()) {
    // Listen to search query changes
    filterSubject
        .debounceTime(const Duration(milliseconds: 500))
        .listen((query) async {
      // Emit loading state
      emit(SearchLoading());
      try {
        if (query.isEmpty) {
          filteredItems.clear();
          emit(SearchInitial());
        } else {
          filteredItems = await repo.searchProducts(query);
          filteredItems.isEmpty
              ? emit(SearchEmpty())
              : emit(SearchLoaded(items: filteredItems));
        }
      } catch (e) {
        emit(SearchError(message: e.toString()));
      }
    });
    // setUpScrollListener();
  }

  // void setUpScrollListener() {
  //   scrollController.addListener(() async {
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       // await loadMoreProducts();
  //     }
  //   });
  // }

  // Call this method whenever the user types a new query
  void search(String query) {
    filterSubject.add(query); // Add the query to the filterSubject stream
  }

  @override
  Future<void> close() {
    filterSubject.close(); // Close the subject when cubit is disposed
    return super.close();
  }
}
