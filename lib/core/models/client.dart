class Client {
  int id;
  String? city;
  String? department;
  String? phone;
  String document;
  String documentType;
  double consumption;
  String rsocial;
  String createdBy;
  String email;
  int? userId;

  Client({
    required this.id,
    this.city,
    this.department,
    this.phone,
    required this.document,
    required this.documentType,
    required this.consumption,
    required this.rsocial,
    required this.createdBy,
    required this.email,
    this.userId,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json["id"],
      city: json["city"],
      department: json["department"],
      phone: json["phone"],
      document: json["document"],
      documentType: json["documentType"],
      consumption: json["consumption"],
      rsocial: json["rsocial"],
      createdBy: json["createdBy"],
      email: json["email"],
      userId: json["userId"],
    );
  } 
}
