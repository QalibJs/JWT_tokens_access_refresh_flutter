import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt/data/model/remote/login_response.dart';

class AuthLocalService {
  AuthLocalService(this._box);
  final Box _box;

  Future<void> saveToken(LoginResponse response) async {
    await _box.put(
      "login",
      jsonEncode(response),
    );
  }

  LoginResponse? get getResponse {
    try {
      String? token = _box.get("login");

      LoginResponse? decodedResponse = LoginResponse.fromJson(
        jsonDecode(token!),
      );
      return decodedResponse;
    } catch (e) {
      return null;
    }
  }

  clear() {
    _box.clear();
  }
}
