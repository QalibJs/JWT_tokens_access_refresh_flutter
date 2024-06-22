import 'package:jwt/data/model/remote/login_response.dart';
import 'package:jwt/utils/constants/endpoints.dart';
import 'package:jwt/utils/controllers/user_controller.dart';
import 'package:jwt/utils/network/client_dio.dart';

class AuthService {
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final data = {
      "email": email,
      "password": password,
    };
    const endpoint = Endpoints.login;

    final response = await authDio.post(endpoint, data: data);

    if (response.statusCode == 201) {
      return LoginResponse.fromJson(response.data);
    }
    throw Exception();
  }

  Future<LoginResponse> refresh() async {
    const endpoint = Endpoints.refresh;

    final queryBody = {"refresh": UserController.refreshToken};

    final response = await authDio.post(endpoint, data: queryBody);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    }
    throw Exception();
  }
}
