// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String? ?? "No title",
      description: json['description'] as String? ?? "No description",
      category: json['category'] as String? ?? "General",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      brand: json['brand'] as String? ?? "Unknown",
      sku: json['sku'] as String? ?? "000000",
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      warrantyInformation:
          json['warrantyInformation'] as String? ?? "No warranty",
      shippingInformation:
          json['shippingInformation'] as String? ?? "Standard shipping",
      availabilityStatus: json['availabilityStatus'] as String? ?? "In stock",
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      returnPolicy: json['returnPolicy'] as String? ?? "No return policy",
      minimumOrderQuantity:
          (json['minimumOrderQuantity'] as num?)?.toInt() ?? 1,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"],
      thumbnail: json['thumbnail'] as String? ?? "",
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'tags': instance.tags,
      'brand': instance.brand,
      'sku': instance.sku,
      'weight': instance.weight,
      'warrantyInformation': instance.warrantyInformation,
      'shippingInformation': instance.shippingInformation,
      'availabilityStatus': instance.availabilityStatus,
      'reviews': instance.reviews,
      'returnPolicy': instance.returnPolicy,
      'minimumOrderQuantity': instance.minimumOrderQuantity,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
    };
