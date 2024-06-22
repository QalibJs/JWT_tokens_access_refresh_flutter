import 'package:jwt/data/contract/auth_contract.dart';
import 'package:jwt/data/model/remote/login_response.dart';
import 'package:jwt/data/service/remote/auth_service.dart';

class AuthRepository extends AuthContract {
  AuthRepository(this._authService);
  final AuthService _authService;
  @override
  Future<LoginResponse> login(
          {required String email, required String password}) =>
      _authService.login(email: email, password: password);

  @override
  Future<LoginResponse> refresh() => _authService.refresh();
}
