import 'package:flutter/material.dart';
import 'package:marketonline/models/subcategory.dart';
import 'package:marketonline/widgets/main_appbar.dart';

class DetailsPage extends StatelessWidget {
  SubCategory? subCategory;

  DetailsPage({this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(child: Text(this.subCategory!.name!)),
    );
  }
}
