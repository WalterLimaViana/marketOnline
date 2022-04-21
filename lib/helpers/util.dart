import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/models/category.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
          color: AppColors.MEATS,
          name: "Açougue",
          imgName: 'acougue',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Padaria",
          imgName: 'padaria',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Grãos",
          imgName: 'graos',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Enlatados",
          imgName: 'enlatados',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Hortifruti",
          imgName: 'hortifruti',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Leite e Derivados",
          imgName: 'leite',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Biscoitos e Bolachas",
          imgName: 'biscuit',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Bebidas",
          imgName: 'bebidas',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Produtos de Higiene",
          imgName: 'higine-bucal',
          icon: IconFontHelper.FISH,
          subCategories: []),
      Category(
          color: AppColors.MEATS,
          name: "Produtos de Limpeza",
          imgName: 'produtos-limpeza',
          icon: IconFontHelper.FISH,
          subCategories: []),
    ];
  }
}
