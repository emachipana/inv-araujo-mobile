import 'package:dio/dio.dart';
import 'package:inv_araujo_mobile/core/constants/api.dart';
import 'package:inv_araujo_mobile/core/local_storage/auth_storage.dart';
import 'package:inv_araujo_mobile/core/models/order.dart';
import 'package:inv_araujo_mobile/core/models/pageable.dart';
import 'package:inv_araujo_mobile/core/models/product.dart';
import 'package:inv_araujo_mobile/core/models/vitro_order.dart';
import 'package:inv_araujo_mobile/core/models/warehouse.dart';

class ApiService {
  final Dio dio = Dio();
  final AuthStorage _storage = AuthStorage();

  Future<List<Warehouse>> fetchWarehouses() async {
    String? token = await _storage.getToken();
    Response res = await dio.get(
      apiConstants["warehouses"] ?? "",
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (res.statusCode != 200) throw res.data["message"];

    return (res.data as List).map((data) => Warehouse.fromJson(data)).toList();
  }

  Future<Pageable> fetchProducts(String filter) async {
    Map<String, String> filters = {
      "lowStock": "&stockLessThan=3",
      "orderByPriceDesc": "&sortby=price&direction=DESC",
    };

    String? token = await _storage.getToken();
    Response res = await dio.get(
      "${apiConstants['products']}?size=8${filters[filter] ?? ''}",
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (res.statusCode != 200) throw res.data["message"];

    return Pageable.fromJson(res.data);
  }

  Future<Pageable> fetchDeliveries(Map<String, bool> categories,
      {String type = "deliver"}) async {
    String url = categories["invitro"] ?? false
        ? '${apiConstants['invitro']}?sortby=finishDate&status=PENDIENTE&direction=DESC&size=16&shipType=${type == "deliver" ? "RECOJO_ALMACEN" : "ENVIO_AGENCIA"}'
        : '${apiConstants['orders']}?sortby=maxShipDate&status=PENDIENTE&direction=DESC&size=16&shipType=${type == "deliver" ? "RECOJO_ALMACEN" : "ENVIO_AGENCIA"}';

    String? token = await _storage.getToken();
    Response res = await dio.get(
      url,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (res.statusCode != 200) throw res.data["message"];

    return Pageable.fromJson(res.data);
  }

  Future<List<Order>> fetchOrderDeliveries() async {
    String? token = await _storage.getToken();
    Response res = await dio.get(
      '${apiConstants['orders']}?sortby=maxShipDate&status=PENDIENTE&direction=DESC&size=5&shipType=RECOJO_ALMACEN',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (res.statusCode != 200) throw res.data["message"];

    return (res.data["content"] as List)
        .map((data) => Order.fromJson(data))
        .toList();
  }

  Future<List<VitroOrder>> fetchVitroOrderDeliveries() async {
    String? token = await _storage.getToken();
    Response res = await dio.get(
      '${apiConstants['invitro']}?sortby=finishDate&status=PENDIENTE&direction=DESC&size=5&shipType=RECOJO_ALMACEN',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (res.statusCode != 200) throw res.data["message"];

    return (res.data["content"] as List)
        .map((data) => VitroOrder.fromJson(data))
        .toList();
  }

  Future<int> fetchTotalDeliver() async {
    String? token = await _storage.getToken();
    Response invitro = await dio.get(
      '${apiConstants['invitro']}/totalDeliver',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (invitro.statusCode != 200) throw invitro.data["message"];

    Response order = await dio.get(
      '${apiConstants['orders']}/totalDeliver',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (order.statusCode != 200) throw order.data["message"];

    return (invitro.data["data"]["total"] as num).toInt() +
        (order.data["data"]["total"] as num).toInt();
  }

  Future<List<Product>> fetchLowProductsStock() async {
    String? token = await _storage.getToken();
    Response res = await dio.get(
      '${apiConstants['products']}?stockLessThan=3&size=4',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (res.statusCode != 200) throw res.data["message"];

    return (res.data["content"] as List)
        .map((data) => Product.fromJson(data))
        .toList();
  }
}
