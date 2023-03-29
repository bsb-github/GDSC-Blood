import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryCodeProvider extends ChangeNotifier {
  String _countryCode = "+92";
  double _longi = 0.0;
  double _lat = 0.0;

  double get longi => _longi;
  double get lat => _lat;

  String get countryCode => _countryCode;

  void setCountryCode(String code) {
    _countryCode = "+" + code;
    notifyListeners();
  }

  void setLoc(double longitude, double latitude) {
    _longi = longitude;
    _lat = latitude;
    notifyListeners();
  }
}
