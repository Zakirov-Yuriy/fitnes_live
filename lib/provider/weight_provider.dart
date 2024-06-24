import 'package:flutter/foundation.dart';

class WeightProvider with ChangeNotifier {
  double _weight = 0.0;

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
    notifyListeners();
  }
}
