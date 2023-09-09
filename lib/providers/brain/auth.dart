import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  List<String> genders = ['Male', 'Female', 'Other'];
  String? email;
  String? code;
  late PageController pageController;
  late PageController resetPageController;

  double _index = 0;
  double _resetIndex = 0;

  double get index => _index;
  set index(double val) {
    _index = val;
    notifyListeners();
  }

  double get resetIndex => _resetIndex;
  set resetIndex(double val) {
    _resetIndex = val;
    notifyListeners();
  }

  int _resend = 0;
  int get resend => _resend;
  set resend(int val) {
    _resend = val;
    notifyListeners();
  }

  reduce() async {
    if (resend > 0) {
      await Future.delayed(
          const Duration(
            seconds: 1,
          ), () {
        resend -= 1;
      });
      reduce();
    } else {
      return;
    }
  }

  // String get gender => _gender;
  // set gender(String val) {
  //   _gender = val;
  //   notifyListeners();
  // }

  bool _agree = false;
  bool get agree => _agree;
  set agree(bool val) {
    _agree = val;
    notifyListeners();
  }

  clear() {
    _index = 0;
    _resetIndex = 0;
    // _gender = 'Male';
  }
}
