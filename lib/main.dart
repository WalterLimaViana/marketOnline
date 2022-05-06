import 'package:flutter/material.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/pages/details_page.dart';
import 'package:marketonline/pages/mainpage.dart';
import 'package:marketonline/pages/mappage.dart';
import 'package:marketonline/pages/onboardingpage.dart';
import 'package:marketonline/pages/selected_category_page.dart';
import 'package:marketonline/pages/welcome_page.dart';
import 'package:marketonline/services/cartservices.dart';
import 'package:marketonline/services/categoryselectionservice.dart';
import 'package:marketonline/services/categoryservice.dart';
import 'package:marketonline/services/loginservice.dart';
import 'package:marketonline/splash_page.dart';

import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => CategorySelectionService()),
        ChangeNotifierProvider(create: (_) => CartService()),
        Provider(create: (_) => CategoryService())
      ],
      child: MaterialApp(
        navigatorKey: Utils.mainAppNav,
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 3, goToPage: '/welcomepage'),
          '/welcomepage': (context) => WelcomePage(),
          '/mainpage': (context) => MainPage(),
          '/selectedcategorypage': (context) => SelectedCategoryPage(),
          '/detailspage': (context) => DetailsPage(),
          '/mappage': (context) => MapPage(),
          '/onboardingpage': (context) => OnboardingPage(),
        },
      )));
}
