import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/models/category.dart';
import 'package:marketonline/models/categorypart.dart';
import 'dart:ui';

import '../models/subcategory.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
          color: AppColors.MEATS,
          name: "Açougue",
          imgName: 'acougue',
          icon: IconFontHelper.ACOUGUE,
          subCategories: [
            SubCategory(
                color: AppColors.MEATS,
                name: "Bovina",
                imgName: 'acougue',
                icon: IconFontHelper.ACOUGUE,
                parts: [
                  CategoryPart(
                      name: 'Picanha', imgName: 'picanha', isSelected: false),
                  CategoryPart(
                      name: 'Picanha', imgName: 'picanha', isSelected: false),
                  CategoryPart(
                      name: 'Picanha', imgName: 'picanha', isSelected: false),
                  CategoryPart(
                      name: 'Picanha', imgName: 'picanha', isSelected: false),
                ]),
            SubCategory(
                color: AppColors.MEATS,
                name: "Suína",
                imgName: 'liver',
                icon: IconFontHelper.PORCO,
                parts: [
                  CategoryPart(
                      name: 'Lombo', imgName: 'acougue', isSelected: false),
                ]),
            SubCategory(
                color: AppColors.YELLOW,
                name: "Galinha",
                imgName: 'chicken',
                icon: IconFontHelper.GALINHA,
                parts: [
                  CategoryPart(
                      name: 'Lombo', imgName: 'acougue', isSelected: false),
                ]),
            SubCategory(
                color: AppColors.GREEN,
                name: "Peixes",
                imgName: 'fish',
                icon: IconFontHelper.FISH,
                parts: [
                  CategoryPart(
                      name: 'Lombo', imgName: 'acougue', isSelected: false),
                ]),
          ]),
      Category(
          color: AppColors.YELLOW,
          name: "Padaria",
          imgName: 'padaria',
          icon: IconFontHelper.PADARIA,
          subCategories: []),
      Category(
          color: AppColors.BROWN,
          name: "Grãos",
          imgName: 'graos',
          icon: IconFontHelper.BEANS,
          subCategories: []),
      Category(
          color: AppColors.SEEDS,
          name: "Enlatados",
          imgName: 'enlatados',
          icon: IconFontHelper.ENLATADOS,
          subCategories: []),
      Category(
          color: AppColors.GREEN,
          name: "Hortifruti",
          imgName: 'hortifruti',
          icon: IconFontHelper.FRUTAS,
          subCategories: []),
      Category(
          color: AppColors.PASTRIES,
          name: "Leite e Derivados",
          imgName: 'leite',
          icon: IconFontHelper.MILK,
          subCategories: []),
      Category(
          color: AppColors.DARKER_GREEN,
          name: "Biscoitos e Bolachas",
          imgName: 'biscuit',
          icon: IconFontHelper.BISCOITOS,
          subCategories: []),
      Category(
          color: AppColors.LIGHTER_GREEN,
          name: "Bebidas",
          imgName: 'bebidas',
          icon: IconFontHelper.DRINKS,
          subCategories: []),
      Category(
          color: AppColors.PINK,
          name: "Produtos de Higiene",
          imgName: 'higine-bucal',
          icon: IconFontHelper.DENTES,
          subCategories: []),
      Category(
          color: AppColors.YELLOW,
          name: "Produtos de Limpeza",
          imgName: 'produtos-limpeza',
          icon: IconFontHelper.LIMPEZA,
          subCategories: []),
    ];
  }
}
