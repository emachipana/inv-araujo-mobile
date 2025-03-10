import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inv_araujo_mobile/core/constants/api.dart';
import 'package:inv_araujo_mobile/core/helpers/toast.dart';
import 'package:inv_araujo_mobile/core/local_storage/auth_storage.dart';
import 'package:inv_araujo_mobile/core/models/login_request.dart';
import 'package:inv_araujo_mobile/core/models/user.dart';

class AuthProvider extends ChangeNotifier {
  final AuthStorage _storage = AuthStorage();
  final Dio dio = Dio();
  User? _currentUser;
  bool _isLoggedIn = false;
  bool _isLoading = false;

  AuthProvider() {
    init();
  }

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  User? get currentUser => _currentUser;

  Future<void> init() async {
    await loadUser(); // Luego cargamos el usuario
  }

  Future<void> login(BuildContext context, LoginRequest request) async {
    try {
      Response res = await dio.post(
        '${apiConstants['auth']}/login',
        data: request.toJson(),
        options: Options(contentType: "application/json"),
      );

      if (res.statusCode != 200) throw res.data["message"];

      _currentUser = User.fromJson(res.data["data"]["user"]);

      if (_currentUser?.role == "CLIENTE") {
        showToast(context, "No tienes los permisos necesarios", isError: true);
        return;
      }

      _isLoggedIn = true;
      await _storage.saveToken(res.data["data"]["token"]);
      notifyListeners();
    } on DioException catch (e) {
      String errorMsg = e.response?.data["message"].contains("Bad credentials")
          ? "Credenciales incorrectas"
          : e.response?.data["message"] ?? "Error de conexión";
      showToast(context, errorMsg, isError: true);
    } catch (e) {
      showToast(context, "Error inesperado", isError: true);
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _currentUser = null;
    await _storage.clearAll();
    notifyListeners();
  }

  Future<void> loadUser() async {
    try {
      String? token = await _storage.getToken();
      if (token == null) return;
      _isLoading = true;

      Response res = await dio.get(
        '${apiConstants['users']}/profile/info',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (res.statusCode != 200) throw Exception(res.data["message"]);

      _currentUser = User.fromJson(res.data["data"]);
      _isLoggedIn = _currentUser?.role != "CLIENTE";
      _isLoading = false;

      notifyListeners();
    } catch (e) {
      print(e);
      _isLoading = false;
    }
  }
}
