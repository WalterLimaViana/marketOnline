import 'dart:ui';

import 'package:marketonline/models/categorypart.dart';

import 'category.dart';

class SubCategory extends Category {
  List<CategoryPart> parts;
  SubCategory({
    required this.parts,
    String? name,
    String? icon,
    Color? color,
    String? imgName,
  }) : super(name: name, icon: icon, color: color, imgName: imgName);
}
