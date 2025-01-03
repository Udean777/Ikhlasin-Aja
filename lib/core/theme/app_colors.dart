import 'package:flutter/material.dart';

abstract class AppColors {
  static const int color1 = 0xFF1A8FE3;
  static const int color2 = 0xFFB3C8CF;
  static const int color3 = 0xFFE5E1DA;
  static const int color4 = 0xFFF1F0E8;
}

const Color primary = Color(AppColors.color1);
const Color onPrimary = Color(0xFFFFFFFF);
const Color secondary = Color(AppColors.color2);
const Color onSecondary = Color(0xFF000000);
const Color error = Color(0xFFB00020);
const Color onError = Color(0xFFFFFFFF);
const Color background = Color(0xFFF5F5F5);
const Color onBackground = Color(0xFF000000);
const Color surface = Color(0xFFFFFFFF);
const Color onSurface = Color(0xFF000000);

const Brightness brightness = Brightness.light;
