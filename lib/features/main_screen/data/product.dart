import 'package:dashboard/features/main_screen/data/review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title = "No title", // Default value
    this.description = "No description", // Default value
    this.category = "General", // Default value
    this.price = 0.0, // Default value
    this.discountPercentage = 0.0, // Default value
    this.rating = 0.0, // Default value
    this.stock = 0, // Default value
    this.tags = const [], // Default empty list
    this.brand = "Unknown", // Default value
    this.sku = "000000", // Default value
    this.weight = 0, // Default value
    this.warrantyInformation = "No warranty", // Default value
    this.shippingInformation = "Standard shipping", // Default value
    this.availabilityStatus = "In stock", // Default value
    this.reviews = const [], // Default empty list
    this.returnPolicy = "No return policy", // Default value
    this.minimumOrderQuantity = 1, // Default value
    this.images = const [
      "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
    ],
    this.thumbnail = "", // Default value
  });

  // JSON serialization
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
