class ResponsivityConstants {
  static ResponsivityConstants? _instance;
  static ResponsivityConstants get instance {
    if (_instance != null) {
      return _instance!;
    }

    _instance = ResponsivityConstants._init();
    return _instance!;
  }

  ResponsivityConstants._init();

  final tablet = 900;
  final handset = 900;
}
