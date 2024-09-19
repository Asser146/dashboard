// import 'package:dashboard/features/main_screen/data/product.dart';
// import 'package:hive/hive.dart';

// class HiveServices {
//   static final HiveServices _instance = HiveServices._internal();
//   late Box<Product> _productsBox;
//   factory HiveServices() {
//     return _instance;
//   }

//   HiveServices._internal();

//   Future<void> init() async {
//     _productsBox = await Hive.openBox<Product>('productsBox');
//   }

//   List<Product> get products {
//     if (!_productsBox.isOpen) {
//       throw Exception('Hive box is not open');
//     }
//     return _productsBox.values.toList();
//   }

//   Future<void> addProducts(List<Product> productsList) async {
//     for (Product product in productsList) {
//       await _productsBox.put(product.id, product);
//     }
//   }

//   Future<void> clearBoxes() async {
//     await _productsBox.clear();
//   }
// }
