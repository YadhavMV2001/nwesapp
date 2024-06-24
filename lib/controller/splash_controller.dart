import 'package:flutter/material.dart';

class SplashScreenProvider with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
