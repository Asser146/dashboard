import 'package:bloc/bloc.dart';
import 'package:dashboard/features/main_screen/domain/product_repository.dart';
import 'package:dashboard/features/main_screen/data/product.dart';
import 'package:equatable/equatable.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  List<String> categories = [];
  final ProductRepository repo;
  AddProductCubit(this.repo) : super(AddProductState.initial()) {
    init();
  }

  Future<void> init() async {
    List<List<String>> cat = await repo.getCategories();
    categories = cat[0];
    emit(state.copyWith(categories: categories));
  }

  void setTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void setDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void setPrice(String price) {
    emit(state.copyWith(price: price));
  }

  void setStock(String stock) {
    emit(state.copyWith(stock: stock));
  }

  void setBrand(String brand) {
    emit(state.copyWith(brand: brand));
  }

  void setDiscount(String discount) {
    emit(state.copyWith(discount: discount));
  }

  void setCategory(String? category) {
    emit(state.copyWith(category: category));
  }

  void setImage(String? imagePath) {
    emit(state.copyWith(imagePath: imagePath));
  }

  void submitProduct() {
    Product newProduct = Product(
        title: state.title,
        description: state.description,
        price: double.tryParse(state.price) ?? 0.0,
        stock: int.tryParse(state.stock) ?? 0,
        brand: state.brand,
        category: state.category ?? "General",
        discountPercentage: double.tryParse(state.discount) ?? 0.0,
        images: [state.imagePath!]);

    repo.addProduct(newProduct);
  }
}
