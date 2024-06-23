import 'package:jwt/app.dart';
import 'package:jwt/data/service/local/auth_local_service.dart';
import 'package:jwt/utils/di/locator.dart';
import 'package:jwt/utils/extension.dart';
import 'package:jwt/utils/helper/pager.dart';

class UserController {
  static final _local = locator.get<AuthLocalService>();

  static String accessToken = _local.getResponse!.tokens.access;
  static String refreshToken = _local.getResponse!.tokens.refresh;
  static String email = _local.getResponse!.email;

  static clear() {
    _local.clear();
    navigatorKey.currentContext!.go(Pager.login);
  }
}
