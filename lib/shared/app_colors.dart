import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFEEEEEE);
  static const Color black = Color(0xFF000000);
  static const Color primary = Color(0xFF0033A0);
  static const Color secondary = Color(0xFF333333);
  static const Color red = Color(0xFFFB7181);
  static const Color lightBlue = Color(0xFF40BFFF);
  static const Color green = Color(0xFF53D1B6);
  static const Color orange = Color(0xFFFFC833);
  static const Color grey = Color(0xFF9098B1);
  static const Color greyBackground = Color(0xFFD9D9D9);
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: secondary.withOpacity(0.2),
      blurRadius: 4,
      offset: const Offset(
        0,
        1,
      ),
      spreadRadius: 1,
    ),
  ];
}
