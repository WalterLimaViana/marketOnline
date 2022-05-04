import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/helpers/unitenums.dart';
import 'package:marketonline/models/category.dart';
import 'package:marketonline/models/categorypart.dart';
import 'package:marketonline/models/onboardingcontent.dart';
import 'dart:ui';

import '../models/subcategory.dart';

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
          message: 'Escolha os produtos \nque deseja e adicione ao carrinho',
          img: 'compras-online'),
      OnboardingContent(
          message:
              'Faça o pagamento\ndiretamente pelo aplicativo,\ncrédito ou débito',
          img: 'pagamento-online'),
      OnboardingContent(
          message:
              'Além da comodidade de\nacompanhar a localização da sua entrega no app',
          img: 'entrega'),
    ];
  }

  // static List<Category> getMockedCategories() {
  //   return [
  //     Category(
  //         color: AppColors.MEATS,
  //         name: "Açougue",
  //         imgName: 'acougue',
  //         icon: IconFontHelper.ACOUGUE,
  //         subCategories: [
  //           SubCategory(
  //               color: AppColors.MEATS,
  //               name: "Bovina",
  //               imgName: 'acougue',
  //               icon: IconFontHelper.ACOUGUE,
  //               parts: [
  //                 CategoryPart(
  //                     name: 'Picanha', imgName: 'picanha', isSelected: false),
  //                 CategoryPart(
  //                     name: 'Acém', imgName: 'acem', isSelected: false),
  //                 CategoryPart(
  //                     name: 'Contra-filé',
  //                     imgName: 'contrafile',
  //                     isSelected: false),
  //                 CategoryPart(
  //                     name: 'Alcatra', imgName: 'alcatra', isSelected: false),
  //                 CategoryPart(
  //                     name: 'Cupim', imgName: 'cupim', isSelected: false),
  //                 CategoryPart(
  //                     name: 'Patinho', imgName: 'patinho', isSelected: false),
  //                 CategoryPart(
  //                     name: 'Maminha', imgName: 'maminha', isSelected: false),
  //                 CategoryPart(
  //                     name: 'Lagarto', imgName: 'lagarto', isSelected: false),
  //                 CategoryPart(
  //                     name: 'Músculo', imgName: 'img', isSelected: false),
  //               ]),
  //           SubCategory(
  //               color: AppColors.MEATS,
  //               name: "Suína",
  //               imgName: 'liver',
  //               icon: IconFontHelper.PORCO,
  //               parts: [
  //                 CategoryPart(
  //                     name: 'Lombo', imgName: 'acougue', isSelected: false),
  //               ]),
  //           SubCategory(
  //               color: AppColors.YELLOW,
  //               name: "Galinha",
  //               imgName: 'chicken',
  //               icon: IconFontHelper.GALINHA,
  //               parts: [
  //                 CategoryPart(
  //                     name: 'Lombo', imgName: 'acougue', isSelected: false),
  //               ]),
  //           SubCategory(
  //               color: AppColors.GREEN,
  //               name: "Peixes",
  //               imgName: 'fish',
  //               icon: IconFontHelper.FISH,
  //               parts: [
  //                 CategoryPart(
  //                     name: 'Lombo', imgName: 'acougue', isSelected: false),
  //               ]),
  //         ]),
  //     Category(
  //         color: AppColors.YELLOW,
  //         name: "Padaria",
  //         imgName: 'padaria',
  //         icon: IconFontHelper.PADARIA,
  //         subCategories: []),
  //     Category(
  //         color: AppColors.BROWN,
  //         name: "Grãos",
  //         imgName: 'graos',
  //         icon: IconFontHelper.BEANS,
  //         subCategories: []),
  //     Category(
  //         color: AppColors.SEEDS,
  //         name: "Enlatados",
  //         imgName: 'enlatados',
  //         icon: IconFontHelper.ENLATADOS,
  //         subCategories: []),
  //     Category(
  //         color: AppColors.GREEN,
  //         name: "Hortifruti",
  //         imgName: 'hortifruti',
  //         icon: IconFontHelper.FRUTAS,
  //         subCategories: []),
  //     Category(
  //         color: AppColors.PASTRIES,
  //         name: "Leite e Derivados",
  //         imgName: 'leite',
  //         icon: IconFontHelper.MILK,
  //         subCategories: []),
  //     Category(
  //         color: AppColors.DARKER_GREEN,
  //         name: "Biscoitos e Bolachas",
  //         imgName: 'biscuit',
  //         icon: IconFontHelper.BISCOITOS,
  //         subCategories: []),
  //     Category(
  //         color: AppColors.LIGHTER_GREEN,
  //         name: "Bebidas",
  //         imgName: 'bebidas',
  //         icon: IconFontHelper.DRINKS,
  //         subCategories: []),
  //     Category(
  //         color: AppColors.PINK,
  //         name: "Produtos de Higiene",
  //         imgName: 'higine-bucal',
  //         icon: IconFontHelper.DENTES,
  //         subCategories: []),
  //     Category(
  //         color: AppColors.YELLOW,
  //         name: "Produtos de Limpeza",
  //         imgName: 'produtos-limpeza',
  //         icon: IconFontHelper.LIMPEZA,
  //         subCategories: []),
  //   ];
  // }

  static String weightUnitToString(WeightUnits unit) {
    switch (unit) {
      case WeightUnits.Kg:
        return 'kg.';
      case WeightUnits.Lb:
        return 'lb.';
      case WeightUnits.Oz:
        return 'oz.';
      default:
        return 'lb.';
    }
  }

  static String deviceSuffix(BuildContext context) {
    String deviceSuffix = '';
    TargetPlatform platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.android:
        deviceSuffix = '_android';
        break;
      case TargetPlatform.iOS:
        deviceSuffix = '_ios';
        break;
      default:
        deviceSuffix = '';
        break;
    }

    return deviceSuffix;
  }
}
