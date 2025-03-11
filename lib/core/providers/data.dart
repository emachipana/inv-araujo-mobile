import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:inv_araujo_mobile/core/helpers/toast.dart';
import 'package:inv_araujo_mobile/core/models/order.dart';
import 'package:inv_araujo_mobile/core/models/pageable.dart';
import 'package:inv_araujo_mobile/core/models/product.dart';
import 'package:inv_araujo_mobile/core/models/vitro_order.dart';
import 'package:inv_araujo_mobile/core/services/api.dart';

class DataProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Order> orderDeliveries = [];
  List<VitroOrder> vitroOrderDeliveries = [];
  Pageable deliveries =
      Pageable(content: [], pageable: {}, totalPages: 0, number: 0);
  Pageable deliveriesBackup =
      Pageable(content: [], pageable: {}, totalPages: 0, number: 0);
  Pageable transfer =
      Pageable(content: [], pageable: {}, totalPages: 0, number: 0);
  Pageable transferBackup =
      Pageable(content: [], pageable: {}, totalPages: 0, number: 0);
  List<Product> productsLowStock = [];
  int totalDeliver = 0;
  Map<String, bool> controller = {
    "home": false,
    "products": false,
    "deliveries": false,
    "transfer": false,
  };

  Future<void> loadOnHome(BuildContext context) async {
    try {
      orderDeliveries = await _apiService.fetchOrderDeliveries();
      vitroOrderDeliveries = await _apiService.fetchVitroOrderDeliveries();
      totalDeliver = await _apiService.fetchTotalDeliver();
      productsLowStock = await _apiService.fetchLowProductsStock();

      controller = {...controller, "home": true};
      notifyListeners();
    } on DioException catch (e) {
      String errorMsg = e.response?.data["message"];
      showToast(context, errorMsg, isError: true);
    } catch (e) {
      print(e);
      showToast(context, "Error inesperado", isError: true);
    }
  }

  Future<void> loadDeliveries(
      BuildContext context, Map<String, bool> activeMainCategories) async {
    try {
      if (controller["deliveries"] ?? false) {
        deliveries = deliveriesBackup;
        return;
      }

      Pageable data = await _apiService.fetchDeliveries(activeMainCategories);
      deliveries = data;
      deliveriesBackup = data;

      controller = {...controller, "deliveries": true};
      notifyListeners();
    } on DioException catch (e) {
      String errorMsg = e.response?.data["message"];
      showToast(context, errorMsg, isError: true);
    } catch (e) {
      print(e);
      showToast(context, "Error inesperado", isError: true);
    }
  }

  Future<void> loadDeliveriesAtClick(
      BuildContext context, Map<String, bool> activeMainCategories) async {
    try {
      deliveries = await _apiService.fetchDeliveries(activeMainCategories);
      notifyListeners();
    } on DioException catch (e) {
      String errorMsg = e.response?.data["message"];
      showToast(context, errorMsg, isError: true);
    } catch (e) {
      print(e);
      showToast(context, "Error inesperado", isError: true);
    }
  }

  Future<void> loadTransfer(
      BuildContext context, Map<String, bool> activeMainCategories) async {
    try {
      if (controller["transfer"] ?? false) {
        transfer = transferBackup;
        return;
      }

      Pageable data = await _apiService.fetchDeliveries(activeMainCategories, type: "transfer");
      transfer = data;
      transferBackup = data;

      controller = {...controller, "transfer": true};
      notifyListeners();
    } on DioException catch (e) {
      String errorMsg = e.response?.data["message"];
      showToast(context, errorMsg, isError: true);
    } catch (e) {
      print(e);
      showToast(context, "Error inesperado", isError: true);
    }
  }

  Future<void> loadTransferAtClick(
      BuildContext context, Map<String, bool> activeMainCategories) async {
    try {
      transfer = await _apiService.fetchDeliveries(activeMainCategories, type: "transfer");
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
