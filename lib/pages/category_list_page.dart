import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/main.dart';
import 'package:marketonline/models/category.dart';
import 'package:marketonline/pages/selected_category_page.dart';
import 'package:marketonline/services/categoryselectionservice.dart';
import 'package:marketonline/widgets/categorybottombar.dart';
import 'package:marketonline/widgets/categorycard.dart';
import 'package:marketonline/widgets/categoryicon.dart';
import 'package:marketonline/widgets/main_appbar.dart';
import 'package:marketonline/widgets/sidemenubar.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  // get category => null;

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    return Scaffold(
        drawer: Drawer(
          child: SideMenuBar(),
        ),
        appBar: MainAppBar(),
        body: Container());
  }
}
