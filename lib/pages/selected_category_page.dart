import 'dart:ui';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/models/category.dart';
import 'package:marketonline/models/subcategory.dart';
import 'package:marketonline/pages/details_page.dart';
import 'package:marketonline/services/categoryselectionservice.dart';
import 'package:marketonline/widgets/categoryicon.dart';
import 'package:marketonline/widgets/main_appbar.dart';
import 'package:provider/provider.dart';

class SelectedCategoryPage extends StatelessWidget {
  Category? selectedCategory;

  SelectedCategoryPage({this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;

    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(
                  color: this.selectedCategory!.color,
                  iconName: this.selectedCategory!.icon,
                ),
                SizedBox(width: 10),
                Text(
                  this.selectedCategory!.name!,
                  style: TextStyle(
                      color: this.selectedCategory!.color, fontSize: 20),
                )
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                    this.selectedCategory!.subCategories!.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      var subcat =
                          this.selectedCategory!.subCategories!.length[index];
                      catSelection.selectedSubCategory = cartService
                          .getCategoryFromCart(subcat as SubCategory);
                      Utils.mainAppNav.currentState!.pushNamed('/detailspage');
                    },
                    child: Container(
                        child: Column(
                      children: [
                        ClipOval(
                            child: Image.asset(
                                'assets/imgs/' +
                                    this
                                        .selectedCategory!
                                        .subCategories![index]
                                        .imgName! +
                                    '.jpg',
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100)),
                        SizedBox(height: 10),
                        Text(
                          this.selectedCategory!.subCategories![index].name!,
                          style: TextStyle(color: this.selectedCategory!.color),
                        )
                      ],
                    )),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
