// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      Product_name: json['Product_name'] as String?,
      Product_description: json['Product_description'] as String?,
      Product_price: json['Product_price'] as String?,
      Product_quantity: json['Product_quantity'] as String?,
      Product_category: json['Product_category'] as String?,
      Product_image: json['Product_image'] as String?,
      Product_type: json['Product_type'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'Product_name': instance.Product_name,
      'Product_type': instance.Product_type,
      'Product_description': instance.Product_description,
      'Product_price': instance.Product_price,
      'Product_quantity': instance.Product_quantity,
      'Product_category': instance.Product_category,
      'Product_image': instance.Product_image,
    };
