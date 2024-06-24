import 'package:flutter/material.dart';

enum HeightUnit { centimeters, feet }

class HeightProvider extends ChangeNotifier {
  int _heightValue = 165; // Изменил тип на int
  HeightUnit _heightUnit = HeightUnit.centimeters;

  int get heightValue => _heightValue; // Также измените возвращаемый тип
  HeightUnit get heightUnit => _heightUnit;

  void updateHeight(double value) {
    _heightValue = value.round(); // Округление до целого
    notifyListeners();
  }

  void toggleHeightUnit() {
    _heightUnit = _heightUnit == HeightUnit.centimeters
        ? HeightUnit.feet
        : HeightUnit.centimeters;
    notifyListeners();
  }
}
