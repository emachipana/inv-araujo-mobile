import 'package:inv_araujo_mobile/core/models/client.dart';
import 'package:inv_araujo_mobile/core/models/employee.dart';

class VitroOrder {
  int id;
  Client client;
  String department;
  String city;
  double total;
  double totalAdvance;
  double pending;
  DateTime initDate;
  DateTime? finishDate;
  DateTime? pickDate;
  String status;
  String location;
  String shippingType;
  Employee? employee;

  VitroOrder({
    required this.id,
    required this.client,
    required this.status,
    required this.location,
    required this.total,
    required this.pending,
    required this.totalAdvance,
    required this.department,
    required this.city,
    required this.initDate,
    required this.shippingType,
    this.finishDate,
    this.pickDate,
    this.employee,
  });

  factory VitroOrder.fromJson(Map<String, dynamic> json) {
    return VitroOrder(
      id: json["id"],
      client: Client.fromJson(json["client"]),
      department: json["department"],
      city: json["city"],
      total: json["total"],
      totalAdvance: json["totalAdvance"],
      pending: json["pending"],
      initDate: DateTime.parse(json["initDate"]),
      finishDate: json["finishDate"] == null ? null : DateTime.parse(json["finishDate"]),
      pickDate: json["pickDate"] == null ? null : DateTime.parse(json["pickDate"]),
      status: json["status"],
      location: json["location"],
      shippingType: json["shippingType"],
      employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
    );
  } 
}
