import 'package:inv_araujo_mobile/core/models/discount.dart';
import 'package:inv_araujo_mobile/core/models/product_image.dart';

class Product {
  int id;
  String name;
  String description;
  String brand;
  String unit;
  double price;
  double purchasePrice;
  int stock;
  int categoryId;
  String categoryName;
  bool isActive;
  List<ProductImage> images;
  Discount? discount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.unit,
    required this.price,
    required this.purchasePrice,
    required this.stock,
    required this.categoryId,
    required this.categoryName,
    required this.isActive,
    required this.images,
    this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      brand: json["brand"],
      unit: json["unit"],
      price: json["price"],
      purchasePrice: json["purchasePrice"],
      stock: json["stock"],
      categoryId: json["categoryId"],
      categoryName: json["categoryName"],
      isActive: json["isActive"],
      images: (json["images"] as List)
        .map((data) => ProductImage.fromJson(data))
        .toList(),
      discount: json["discount"] == null ? null : Discount.fromJson(json["discount"]),
    );
  } 
}
