import 'package:flutter/material.dart';
import 'package:open_coffeeshop/module/product/product.dart';

class AppRoutes {
  static const String main = '/';
  static const String login = '/login';
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return _materialRoute(
          const HomePage(),
        );

      default:
        return _materialRoute(
          const HomePage(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => view,
    );
  }
}
