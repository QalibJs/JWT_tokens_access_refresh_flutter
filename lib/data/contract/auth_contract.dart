import 'package:jwt/data/model/remote/login_response.dart';

abstract class AuthContract {
  Future<LoginResponse> login({
    required String email,
    required String password,
  });

  Future<LoginResponse> refresh();
}
