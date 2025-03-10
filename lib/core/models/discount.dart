class Discount {
  int id;
  int productId;
  double price;
  int percentage;

  Discount({
    required this.id,
    required this.productId,
    required this.price,
    required this.percentage,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json["id"],
      productId: json["productId"],
      price: json["price"],
      percentage: json["percentage"],
    );
  } 
}
