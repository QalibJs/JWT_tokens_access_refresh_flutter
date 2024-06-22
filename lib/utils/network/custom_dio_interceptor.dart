import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:jwt/data/contract/auth_contract.dart';
import 'package:jwt/data/service/local/auth_local_service.dart';
import 'package:jwt/utils/controllers/user_controller.dart';
import 'package:jwt/utils/di/locator.dart';

class CustomDioInterceptor implements AwesomeDioInterceptor {
  final _local = locator.get<AuthLocalService>();
  final _contract = locator.get<AuthContract>();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response!.statusCode == 401) {
      try {
        final response = await _contract.refresh();
        _local.saveToken(response);
      } catch (e) {
        UserController.clear();
      }
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
