class Employee {
  int id;
  String rsocial;
  String document;
  String email;
  String phone;
  int? userId;

  Employee({
    required this.id,
    required this.document,
    required this.rsocial,
    required this.email,
    required this.phone,
    this.userId,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json["id"],
      phone: json["phone"],
      document: json["document"],
      rsocial: json["rsocial"],
      email: json["email"],
      userId: json["userId"],
    );
  } 
}
