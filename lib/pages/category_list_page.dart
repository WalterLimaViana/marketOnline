import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/helpers/util.dart';
import 'package:marketonline/main.dart';
import 'package:marketonline/models/category.dart';
import 'package:marketonline/pages/selected_category_page.dart';
import 'package:marketonline/widgets/categorybottombar.dart';
import 'package:marketonline/widgets/categorycard.dart';
import 'package:marketonline/widgets/categoryicon.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  get category => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Center(
            child: IconFont(
              iconName: IconFontHelper.FISH,
              color: AppColors.SECUNDARY_COLOR,
              size: 40,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: AppColors.SECUNDARY_COLOR),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(10),
                child: ClipOval(
                    child: Image.asset('assets/imgs/shopping-venture.jpg')))
          ],
        ),
        body: Container(
            child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Selecione uma categoria:',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 120),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return CategoryCard(
                            category: categories[index],
                            onCardClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectedCategoryPage()));
                            });
                      }))
            ],
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: CategoryBottomBar())
        ])));
  }
}
