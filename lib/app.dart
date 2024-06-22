import 'package:flutter/material.dart';
import 'package:jwt/data/service/local/auth_local_service.dart';
import 'package:jwt/utils/di/locator.dart';
import 'package:jwt/utils/helper/pager.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final local = locator.get<AuthLocalService>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: local.getResponse == null ? Pager.login : Pager.home,
    );
  }
}
