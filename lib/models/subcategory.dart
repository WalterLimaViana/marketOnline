import 'dart:ui';
import 'dart:js';

import 'package:marketonline/models/categorypart.dart';

import 'category.dart';

class SubCategory extends Category {
  List<CategoryPart> parts;
  SubCategory({
    this.parts = const [],
    String? name,
    String? icon,
    Color? color,
    String? imgName,
  }) : super(name: name, icon: icon, color: color, imgName: imgName);
}
