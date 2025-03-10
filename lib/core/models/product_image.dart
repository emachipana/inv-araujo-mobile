import 'package:inv_araujo_mobile/core/models/image.dart';

class ProductImage {
  int id;
  int productId;
  Image image;

  ProductImage({
    required this.id,
    required this.productId,
    required this.image,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json["id"],
      productId: json["productId"],
      image: Image.fromJson(json["image"]),
    );
  } 
}
