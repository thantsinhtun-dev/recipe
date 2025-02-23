import 'dart:ui';

import 'package:flutter/material.dart';

// Primary Colors
const Color primaryColor = Color(0xFF43927D); // Light Green
const Color primaryDarkColor = Color(0xFF43927D); // Darker Green
const Color primaryLightColor = Color(0xFF43927D); // Lighter Green

const Color whiteColor = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF000000);
const Color grayColor = Color(0xFF454545);
const Color transparentColor = Colors.transparent;

class AppColors {
  final Color primaryColor;
  final Color whiteColor;
  final Color blackColor;
  final Color grayColor;
  final Color transparentColor;

  const AppColors({
    required this.primaryColor,
    required this.whiteColor,
    required this.blackColor,
    required this.grayColor,
    this.transparentColor = Colors.transparent,
  });
}

// Define LIGHT Theme Colors
const AppColors appColorLight = AppColors(
  primaryColor: primaryColor,
  whiteColor: whiteColor,
  blackColor: blackColor,
  grayColor: grayColor,
);

// Define DARK Theme Colors
const AppColors appColorDark = AppColors(
  primaryColor: primaryColor,
  whiteColor: whiteColor,
  blackColor: blackColor,
  grayColor: grayColor,
);

extension ContextThemeExtension on BuildContext {
  AppColors get appColors =>
      Theme.of(this).brightness == Brightness.light ? appColorLight : appColorDark;

  ThemeData get appTheme => Theme.of(this);
}
