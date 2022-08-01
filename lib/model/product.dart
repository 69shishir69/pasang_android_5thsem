import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  String? id;
  String? Product_name;
  String? Product_type;
  String? Product_description;
  String? Product_price;
  String? Product_quantity;
  String? Product_category;
  String? Product_image;
  String? userId;


  Product({
    this.id,
    this.Product_name,
    this.Product_description,
    this.Product_price,
    this.Product_quantity,
    this.Product_category,
    this.Product_image,
    this.Product_type,
    this.userId,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}