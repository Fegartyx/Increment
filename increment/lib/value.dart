import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Value with ChangeNotifier {
  static int value = 0;

  Value() {
    getValue();
  }

  increment() async {
    final prefs = await SharedPreferences.getInstance();
    value++;
    prefs.setInt('value', value);
    notifyListeners();
  }

  getValue() async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getInt('value') ?? 0;
    notifyListeners();
  }

  reset() async {
    final prefs = await SharedPreferences.getInstance();
    value = 0;
    prefs.remove('value');
    notifyListeners();
  }
}
