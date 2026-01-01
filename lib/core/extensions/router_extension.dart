import 'package:flutter/material.dart';

extension RouterExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget screen, {Object? arguments}) {
    return Navigator.of(this).push(MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(arguments: arguments)));
  }

  Future<T?> pushRaplacement<T extends Object?>(Widget screen,
      {Object? arguments}) {
    return Navigator.of(this).pushReplacement(MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(arguments: arguments)));
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }
}
