enum Flavor {
  dev,
  prod,
}

class AppFlavor {
  static Flavor flavor = Flavor.dev;

  static String get name => flavor.name ?? '';

  static String get title {
    switch (flavor) {
      case Flavor.dev:
        return 'EzLive Dev';
      case Flavor.prod:
        return 'EzLive';
    }
  }
}
