import 'package:flutter/material.dart';
import 'package:marketonline/helpers/util.dart';
import 'package:marketonline/pages/details_page.dart';
import 'package:marketonline/pages/mappage.dart';
import 'package:marketonline/pages/onboardingpage.dart';
import 'package:marketonline/pages/selected_category_page.dart';
import 'package:marketonline/pages/welcome_page.dart';
import 'package:marketonline/services/loginservice.dart';
import 'package:marketonline/splash_page.dart';
import 'dart:ui';

import 'package:provider/provider.dart';

void main() {
  runApp(Provider(
      create: (_) => LoginService(),
      child: MaterialApp(
          theme: ThemeData(fontFamily: 'Raleway'),
          debugShowCheckedModeBanner: false,
          home:
              // DetailsPage(

              SplashPage(duration: 3, goToPage: WelcomePage()))));
}
