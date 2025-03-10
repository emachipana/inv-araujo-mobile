class Category {
  int id;
  String name;
  int? categoryId;

  Category({
    required this.id,
    required this.name,
    this.categoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      categoryId: json["categoryId"],
    );
  } 
}
