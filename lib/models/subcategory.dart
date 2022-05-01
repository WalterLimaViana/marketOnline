import 'dart:ui';
import 'dart:js';

import 'package:marketonline/helpers/unitenums.dart';
import 'package:marketonline/models/categorypart.dart';

import 'category.dart';

class SubCategory extends Category {
  List<CategoryPart> parts;
  double price;
  WeightUnits unit;
  int amount;
  Color? themeColor;

  double getTotalPrice() {
    return this.amount * this.price;
  }

  SubCategory({
    this.parts = const [],
    this.price = 0.0,
    this.unit = WeightUnits.Kg,
    this.amount = 0,
    String? name,
    String? icon,
    Color? color,
    String? imgName,
  }) : super(name: name, icon: icon, color: color, imgName: imgName);
}
