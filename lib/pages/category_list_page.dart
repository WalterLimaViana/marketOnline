import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/main.dart';
import 'package:marketonline/models/category.dart';
import 'package:marketonline/pages/selected_category_page.dart';
import 'package:marketonline/services/categoryselectionservice.dart';
import 'package:marketonline/services/categoryservice.dart';
import 'package:marketonline/widgets/categorybottombar.dart';
import 'package:marketonline/widgets/categorycard.dart';
import 'package:marketonline/widgets/categoryicon.dart';
import 'package:marketonline/widgets/main_appbar.dart';
import 'package:marketonline/widgets/sidemenubar.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {
  // List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    CategoryService catService =
        Provider.of<CategoryService>(context, listen: false);
    List<Category> categories = catService.getCategories();
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text('Selecione uma categoria:',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext ctx, int index) {
            return CategoryCard(
                category: categories[index],
                onCardClick: () {
                  catSelection.selectedCategory = categories[index];
                  Utils.mainAppNav.currentState!
                      .pushNamed('/selectedcategorypage');
                });
          },
        ),
      )
    ]);
  }
}
