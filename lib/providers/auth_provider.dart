import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoginPage = true;
  bool get isLoginPage => _isLoginPage;

  void toggleLogin() {
    _isLoginPage = !_isLoginPage;
    print("Login Page: $_isLoginPage");
    notifyListeners();
  }
}
