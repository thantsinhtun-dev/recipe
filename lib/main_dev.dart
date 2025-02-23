import 'package:flutter/material.dart';

import 'core/core.dart';
import 'main_common.dart' as runner;

Future<void> main() async {
  AppFlavor.flavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();

  await runner.main();
}
