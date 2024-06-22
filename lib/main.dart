import 'package:flutter/material.dart';
import 'package:jwt/app.dart';
import 'package:jwt/utils/di/locator.dart';

void main() async {
  await hive();
  await setup();
  runApp(const MyApp());
}
