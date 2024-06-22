import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt/data/contract/auth_contract.dart';
import 'package:jwt/data/repository/repository.dart';
import 'package:jwt/data/service/local/auth_local_service.dart';
import 'package:jwt/data/service/remote/auth_service.dart';

final locator = GetIt.instance;

hive() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
}

setup() async {
  locator.registerLazySingleton<AuthContract>(() => AuthRepository(locator()));
  final box = await Hive.openBox("login");
  locator.registerLazySingleton(() => AuthLocalService(box));
  locator.registerLazySingleton(() => AuthService());
}
