import 'package:flutter/material.dart';

extension Rooter on BuildContext {
   go(screen) => Navigator.pushReplacement(
        this,
        MaterialPageRoute(builder: (_) => screen),
      );
}
