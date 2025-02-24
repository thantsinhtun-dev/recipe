import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/core.dart';
import 'routes/app_route.dart';
import 'shared/services/local/preferences.dart';

FutureOr<void> main() async {
  final router = AppRouter();
  await EasyLocalization.ensureInitialized();
  await Preferences().init();

  // Preferences().clearData();
  runApp(
    EasyLocalization(
      supportedLocales: Languages.values.map((e) => e.locale).toList(),
      fallbackLocale: Languages.english.locale,
      useFallbackTranslations: true,
      path: 'assets/translations',
      child: ProviderScope(
        child: MyApp(router: router),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppFlavor.title,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
    );
  }
}
