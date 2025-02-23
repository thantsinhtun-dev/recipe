import 'package:flutter/material.dart';

import 'app_images.dart';

enum Languages {
  english(Locale('en'), 'English'),
  myanmar(Locale('my'), 'Myanmar');

  const Languages(this.locale, this.title);

  final Locale locale;
  final String title;

  String get getImage => switch (this) {
    Languages.english => AppImages.icEnglish,
    Languages.myanmar => AppImages.icMyanmar,
  };
  static Languages getLanguage(Locale locale){
    switch (locale.languageCode) {
      case 'en':
        return Languages.english;
      case 'my':
        return Languages.myanmar;
      default:
        return Languages.english;
    }
  }

}
enum FontFamily {
  poppins('Poppins'),
  pyidaungsu('Pyidaungsu');

  const FontFamily(this.value);

  final String value;
}

enum FontSize {
  s10(10),
  s12(12),
  s13(13),
  s14(14),
  s15(15),
  s16(16),
  s18(18),
  s20(20),
  s22(22),
  s24(24),
  s28(28),
  s34(34);

  const FontSize(this.value);

  final double value;
}

class AppFontStyle {
  const AppFontStyle(this.context);

  final BuildContext context;

  TextStyle? customFont({
    FontFamily fontFamily = FontFamily.poppins,
    FontSize fontSize = FontSize.s14,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationThickness: 2,
    );
  }
}

extension ContextLocaleExtension on BuildContext {
  AppFontStyle get appFonts => AppFontStyle(this);
}
