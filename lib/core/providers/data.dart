import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:inv_araujo_mobile/core/constants/api.dart';
import 'package:inv_araujo_mobile/core/helpers/toast.dart';
import 'package:inv_araujo_mobile/core/local_storage/auth_storage.dart';
import 'package:inv_araujo_mobile/core/models/order.dart';
import 'package:inv_araujo_mobile/core/models/product.dart';
import 'package:inv_araujo_mobile/core/models/vitro_order.dart';

class DataProvider extends ChangeNotifier {
  final AuthStorage _storage = AuthStorage();
  final Dio dio = Dio();
  List<Order> _orderDeliveries = [];
  List<VitroOrder> _vitroOrderDeliveries = [];
  List<Product> _productsLowStock = [];
  int _totalDeliver = 0;
  Map<String, bool> _controller = {
    "home": false,
    "products": false,
    "deliveries": false,
  };

  List<Order> get orderDeliveries => _orderDeliveries;
  List<VitroOrder> get vitroOrderDeliveries => _vitroOrderDeliveries;
  List<Product> get productsLowStock => _productsLowStock;
  int get totalDeliver => _totalDeliver;
  Map<String, bool> get controller => _controller;

  Future<List<Order>> fetchOrderDeliveries() async {
    String? token = await _storage.getToken();
    Response res = await dio.get(
      '${apiConstants['orders']}?sortby=maxShipDate&direction=DESC&size=5&shipType=RECOJO_ALMACEN',
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
      '${apiConstants['invitro']}?sortby=finishDate&direction=DESC&size=5&shipType=RECOJO_ALMACEN',
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
      '${apiConstants['products']}?stockLessThan=3&size=6',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (res.statusCode != 200) throw res.data["message"];

    return (res.data["content"] as List)
        .map((data) => Product.fromJson(data))
        .toList();
  }

  Future<void> loadOnHome(BuildContext context) async {
    try {
      _orderDeliveries = await fetchOrderDeliveries();
      _vitroOrderDeliveries = await fetchVitroOrderDeliveries();
      _totalDeliver = await fetchTotalDeliver();
      _productsLowStock = await fetchLowProductsStock();

      _controller = {..._controller, "home": true};
      notifyListeners();
    } on DioException catch (e) {
      String errorMsg = e.response?.data["message"];
      showToast(context, errorMsg, isError: true);
    } catch (e) {
      print(e);
      showToast(context, "Error inesperado", isError: true);
    }
  }
}
