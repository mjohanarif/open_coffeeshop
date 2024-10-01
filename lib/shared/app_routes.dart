import 'package:flutter/material.dart';
import 'package:open_coffeeshop/module/product/product.dart';
import 'package:open_coffeeshop/module/weather/presentation/ui/pages/forecast_page.dart';

class AppRoutes {
  static const String main = '/';
  static const String detailProductPage = '/detail-product-page';
  static const String cartPage = '/cart-page';
  static const String paymentPage = '/payment-page';
  static const String forecastPage = '/forecast-page';
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return _materialRoute(
          const HomePage(),
        );
      case detailProductPage:
        return _materialRoute(
          DetailProductPage(data: settings.arguments as ProductModel),
        );
      case cartPage:
        return _materialRoute(
          const CartPage(),
        );
      case paymentPage:
        return _materialRoute(
          const PaymentPage(),
        );
      case forecastPage:
        return _materialRoute(
          const ForecastPage(),
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
