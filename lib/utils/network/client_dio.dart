import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:jwt/utils/controllers/user_controller.dart';
import 'package:jwt/utils/network/custom_dio_interceptor.dart';

final authDio = Dio(
  BaseOptions(
    headers: {"Authorization": "Bearer ${UserController.accessToken}"},
  ),
)
  ..interceptors.add(CustomDioInterceptor())
  ..interceptors.add(
    AwesomeDioInterceptor(),
  );
