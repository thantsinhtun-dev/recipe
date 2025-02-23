import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: appColorLight.primaryColor,
    scaffoldBackgroundColor: appColorLight.whiteColor,
    cardTheme: const CardTheme(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: appColorLight.blackColor.withValues(alpha: 0.5),
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 57.0,
      ),
      displayMedium: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 45.0,
      ),
      displaySmall: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 36.0,
      ),
      headlineLarge: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 32.0,
      ),
      headlineMedium: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 28.0,
      ),
      headlineSmall: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 24.0,
      ),
      titleLarge: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 22.0,
      ),
      titleMedium: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 16.0,
      ),
      titleSmall: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 14.0,
      ),
      labelLarge: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 14.0,
      ),
      labelMedium: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 12.0,
      ),
      labelSmall: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 11.0,
      ),
      bodyLarge: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: appColorLight.blackColor,
        fontSize: 12.0,
      ),
    ),
    checkboxTheme: const CheckboxThemeData(),
    switchTheme: const SwitchThemeData().copyWith(),
    radioTheme: const RadioThemeData(
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      // fillColor: colorPrimaryLight
    ),
    appBarTheme: AppBarTheme(
      color: appColorLight.whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appColorLight.whiteColor,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: appColorLight.whiteColor),
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: appColorDark.primaryColor,
    scaffoldBackgroundColor: appColorDark.whiteColor,
    cardTheme: const CardTheme(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: appColorDark.whiteColor.withValues(alpha: 0.5),
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 57.0,
      ),
      displayMedium: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 45.0,
      ),
      displaySmall: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 36.0,
      ),
      headlineLarge: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 32.0,
      ),
      headlineMedium: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 28.0,
      ),
      headlineSmall: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 24.0,
      ),
      titleLarge: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 22.0,
      ),
      titleMedium: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 16.0,
      ),
      titleSmall: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 14.0,
      ),
      labelLarge: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 14.0,
      ),
      labelMedium: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 12.0,
      ),
      labelSmall: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 11.0,
      ),
      bodyLarge: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: appColorDark.whiteColor,
        fontSize: 12.0,
      ),
    ),
    checkboxTheme: const CheckboxThemeData(),
    switchTheme: const SwitchThemeData().copyWith(),
    radioTheme: const RadioThemeData(
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      // fillColor: colorPrimaryLight
    ),
    appBarTheme: AppBarTheme(
      color: appColorDark.whiteColor,
      iconTheme: IconThemeData(color: appColorDark.whiteColor),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: appColorDark.whiteColor),
  );
}

const SystemUiOverlayStyle lightOverlayStyle = SystemUiOverlayStyle(
  systemStatusBarContrastEnforced: true,
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarContrastEnforced: false,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.dark,
);

const SystemUiOverlayStyle darkOverlayStyle = SystemUiOverlayStyle(
  systemStatusBarContrastEnforced: false,
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarContrastEnforced: false,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);
