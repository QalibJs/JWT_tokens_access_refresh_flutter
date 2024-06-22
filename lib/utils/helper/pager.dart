import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt/cubit/auth_cubit.dart';
import 'package:jwt/presentation/screens/home_screen.dart';
import 'package:jwt/presentation/screens/login_screen.dart';
import 'package:jwt/utils/di/locator.dart';

class Pager {
  Pager._();

  static Widget login = BlocProvider(
    create: (context) => AuthCubit(locator(), locator()),
    child: const LoginScreen(),
  );

  static Widget home = const HomeScreen();
}
