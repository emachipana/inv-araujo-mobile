class Warehouse {
  int id;
  String name;
  String department;
  String province;
  String district;
  String address;
  int products;

  Warehouse({
    required this.id,
    required this.name,
    required this.department,
    required this.province,
    required this.district,
    required this.address,
    required this.products,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(
      id: json["id"],
      name: json["name"],
      department: json["department"],
      province: json["province"],
      district: json["district"],
      address: json["address"],
      products: json["products"],
    );
  }
}
