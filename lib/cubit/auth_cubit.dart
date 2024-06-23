import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt/cubit/auth_state.dart';
import 'package:jwt/data/contract/auth_contract.dart';
import 'package:jwt/data/service/local/auth_local_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authContract, this._authLocalService) : super(AuthInitial());
  final AuthContract _authContract;
  final AuthLocalService _authLocalService;

  final controllers = {
    "email": TextEditingController(),
    "password": TextEditingController(),
  };

  //dd@gmail.com
  //Test1234!
  

  Future<void> login() async {
    try {
      emit(AuthLoading());
      final response = await _authContract.login(
        email: controllers['email']!.text,
        password: controllers['password']!.text,
      );
      print("object");
      await _authLocalService.saveToken(response);
      print("object");

      emit(AuthSuccess());
    } catch (e, s) {
      log(s.toString());
      emit(AuthError());
    }
  }

  @override
  Future<void> close() {
    for (final controller in controllers.values) {
      controller.dispose();
    }
    return super.close();
  }
}
