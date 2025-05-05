import 'package:flutter/widgets.dart';

class ShopCategoryProvider extends ChangeNotifier{
   String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}