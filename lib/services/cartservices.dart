import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:marketonline/models/cartitem.dart';
import 'package:marketonline/models/subcategory.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(CartItem item) {
    items.add(item);
    notifyListeners();
  }

  bool? isSubCategoryAddesdToCart(SubCategory cat) {
    return _items.length > 0
        ? _items.any((CartItem item) => item.category!.name == cat.name)
        : false;
  }

  double getShoppingCartTotalPrice() {
    double mainTotal = 0;
    _items.forEach((CartItem item) {
      SubCategory itemSubCategory = (item.category as SubCategory);
      double total = itemSubCategory.amount * itemSubCategory.price;
      mainTotal += total;
    });
    return mainTotal;
  }

  void remove(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll(CartItem item) {
    _items.clear();
    notifyListeners();
  }

  SubCategory getCategoryFromCart(SubCategory cat) {
    SubCategory subCat = cat;
    if (_items.length > 0 &&
        _items.any((CartItem item) => item.category!.name == cat.name)) {
      CartItem cartItem =
          _items.firstWhere((CartItem item) => item.category!.name == cat.name);

      if (cartItem != null) {
        subCat = cartItem.category as SubCategory;
      }
    }
    return subCat;
  }
}
