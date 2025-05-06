import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final Map<int, int> _quantities = {}; 

  int getQuantity(int index) {
    return _quantities[index] ?? 1;
  }

  void increment(int index) {
    _quantities[index] = getQuantity(index) + 1;
    notifyListeners();
  }

  void decrement(int index) {
    if (getQuantity(index) > 1) {
      _quantities[index] = getQuantity(index) - 1;
      notifyListeners();
    }
  }
}
