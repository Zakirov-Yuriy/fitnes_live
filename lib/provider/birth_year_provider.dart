import 'package:flutter/material.dart';

class BirthYearProvider with ChangeNotifier {
  int _birthYear = DateTime.now().year - 30;

  int get birthYear => _birthYear;

  set birthYear(int year) {
    _birthYear = year;
    notifyListeners();
  }
}
