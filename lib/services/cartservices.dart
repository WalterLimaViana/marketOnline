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
}
