import 'package:flutter/material.dart';

class ShowPassProvider extends ChangeNotifier {
  bool _showPass = false;
  bool _showPassSignUp = false;
  bool __showPassSignUp = false;
  bool get showPass => _showPass;
  bool get showPassSignUp => _showPassSignUp;
  bool get showPassPage => __showPassSignUp;

  void changeShowPassState() {
    _showPass = !_showPass;
    notifyListeners();
  }

  void changeShowPassSignUpState() {
    _showPassSignUp = !_showPassSignUp;
    notifyListeners();
  }

  void change_ShowPassSignUpState() {
    __showPassSignUp = !__showPassSignUp;
    notifyListeners();
  }
}
