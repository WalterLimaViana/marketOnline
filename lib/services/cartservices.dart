import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketonline/models/cartitem.dart';
import 'package:marketonline/models/category.dart';
import 'package:marketonline/models/subcategory.dart';
import 'package:marketonline/services/categoryselectionservice.dart';
import 'package:marketonline/services/categoryservice.dart';
import 'package:marketonline/services/loginservice.dart';
import 'package:provider/provider.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];
  FirebaseFirestore? _instance;

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(CartItem item) {
    items.add(item);
    notifyListeners();
  }

  bool isSubCategoryAddedToCart(SubCategory cat) {
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

  void loadCartItemsFromFirebase(BuildContext context) {
    if (_items.length > 0) {
      _items.clear();
    }

    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    CategoryService catService =
        Provider.of<CategoryService>(context, listen: false);
    CategorySelectionService categorySelectionService =
        Provider.of<CategorySelectionService>(context, listen: false);

    if (loginService.isUserLoggedIn()) {
      _instance = FirebaseFirestore.instance;
      _instance!
          .collection('shoppers')
          .doc(loginService.loggedInUserModel!.uid)
          .get()
          .then((DocumentSnapshot snapshot) {
        if (snapshot.exists) {
          Map<String, dynamic> cartItems =
              snapshot.get(FieldPath(['cartItems']));

          catService.getCategories().forEach((Category cat) {
            cat.subCategories!.forEach((Category subCat) {
              if (cartItems.keys.contains(subCat.imgName)) {
                var amount = cartItems[subCat.imgName] as int;
                (subCat as SubCategory).amount = amount;
                _items.add(CartItem(category: subCat));

                // force resetting the selected subcategory to trigger a rebuild on the unit price widget
                if (categorySelectionService.selectedSubCategory != null &&
                    categorySelectionService.selectedSubCategory!.name ==
                        subCat.name) {
                  categorySelectionService.selectedSubCategory = subCat;
                }
              }
            });
          });

          notifyListeners();
        }
      });
    }
    ;
  }
}
