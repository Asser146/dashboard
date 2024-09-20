part of 'add_product_cubit.dart';

class AddProductState extends Equatable {
  final String title;
  final String description;
  final String price;
  final String stock;
  final String brand;
  final String discount;
  final String? category;
  final String? imagePath;
  final List<String> categories;

  const AddProductState({
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
    required this.brand,
    required this.discount,
    this.category,
    this.imagePath,
    required this.categories,
  });

  factory AddProductState.initial() {
    return const AddProductState(
      title: '',
      description: '',
      price: '',
      stock: '',
      brand: '',
      discount: '',
      category: null,
      imagePath: '',
      categories: [],
    );
  }

  AddProductState copyWith({
    String? title,
    String? description,
    String? price,
    String? stock,
    String? brand,
    String? discount,
    String? category,
    String? imagePath,
    List<String>? categories,
  }) {
    return AddProductState(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      discount: discount ?? this.discount,
      category: category ?? this.category,
      imagePath: imagePath ?? this.imagePath,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        price,
        stock,
        brand,
        discount,
        category,
        imagePath,
        categories,
      ];
}
