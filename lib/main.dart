import 'package:flutter/material.dart';
import 'package:marketonline/helpers/util.dart';
import 'package:marketonline/pages/details_page.dart';
import 'package:marketonline/pages/mappage.dart';
import 'package:marketonline/pages/onboardingpage.dart';
import 'package:marketonline/pages/selected_category_page.dart';
import 'package:marketonline/pages/welcome_page.dart';
import 'package:marketonline/splash_page.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Raleway'),
    debugShowCheckedModeBanner: false,
    home:
        // DetailsPage(

        SplashPage(duration: 3, goToPage: WelcomePage()),
  ));
}

class IconFont extends StatelessWidget {
  Color? color;
  double? size;
  String? iconName;

  IconFont({this.color, this.size, this.iconName});

  @override
  Widget build(BuildContext context) {
    return Text(this.iconName!,
        style: TextStyle(
            color: this.color,
            fontSize: this.size,
            fontFamily: 'marketonline'));
  }
}
