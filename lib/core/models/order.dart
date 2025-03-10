import 'package:inv_araujo_mobile/core/models/client.dart';
import 'package:inv_araujo_mobile/core/models/employee.dart';

class Order {
  int id;
  Client client;
  String status;
  String location;
  double total;
  String department;
  String city;
  DateTime date;
  DateTime maxShipDate;
  String shippingType;
  Employee? employee;

  Order({
    required this.id,
    required this.client,
    required this.status,
    required this.location,
    required this.total,
    required this.department,
    required this.city,
    required this.date,
    required this.maxShipDate,
    required this.shippingType,
    this.employee,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      client: Client.fromJson(json["client"]),
      status: json["status"],
      location: json["location"],
      total: json["total"],
      department: json["department"],
      city: json["city"],
      date: DateTime.parse(json["date"]),
      maxShipDate: DateTime.parse(json["maxShipDate"]),
      shippingType: json["shippingType"],
      employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
    );
  } 
}
