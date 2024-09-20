import 'package:dashboard/core/di/dependency_injection.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/features/main_screen/data/base_response.dart';
import 'package:dashboard/features/main_screen/data/product.dart';

class ProductRepository {
  // final HiveServices _hiveServices = getIt<HiveServices>();
  List<Product> products = [];
  ApiService client = getIt<ApiService>();
  Future<void> fetchAllProducts() async {
    // _hiveServices.init();
    // _hiveServices.clearBoxes();
    // products = _hiveServices.products;

    // if (products.isEmpty) {
    //   await _hiveServices.addProducts(products);
    // } else {
    try {
      BaseResponse response = await client.getAllProducts();
      products = response.products ?? [];
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
    // }
  }

  Future<List<Product>> getProducts() async {
    if (products.isEmpty) {
      await fetchAllProducts();
    }
    return products;
  }

  Future<List<String>> getCategories() async {
    try {
      final categories = await client.getCategories();

      // Initialize an empty list to store category names
      List<String> categoriesNames = [];
      // Extract the name from each category object and add it to the list
      for (var category in categories) {
        categoriesNames.add(category.name ?? "NA");
      }
      return categoriesNames;
    } catch (e) {
      print('Error fetching categories: $e');
      rethrow; // Rethrow the error after logging it
    }
  }

  Future<List<Product>> getCategoryProducts(String category) async {
    try {
      BaseResponse response = await client.getProductsbyCategory(category);
      return response.products ?? [];
    } catch (e) {
      print('Error fetching category products: $e');
      rethrow; // Rethrow the error after logging it
    }
  }

  Future<void> addProduct(Product item) async {
    try {
      Product product = await client.addProduct(item);
      products.insert(0, product);
    } catch (e) {
      print('Error adding : $e');
      rethrow; // Rethrow the error after logging it
    }
  }
}
