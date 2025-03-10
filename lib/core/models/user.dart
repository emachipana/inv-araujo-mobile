import 'package:inv_araujo_mobile/core/models/image.dart';

class User {
  int id;
  String role;
  String fullName;
  Image? image;

  User({
    required this.id,
    required this.role,
    required this.fullName,
    this.image
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      role: json["role"],
      fullName: json["fullName"],
      image: json["image"]
    );
  }
}
