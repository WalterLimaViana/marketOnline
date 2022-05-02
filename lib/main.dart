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
import 'package:marketonline/services/loginservice.dart';
import 'package:marketonline/splash_page.dart';

import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
      providers: [
        Provider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => CategorySelectionService()),
        Provider(create: (_) => CartService())
      ],
      child: MaterialApp(
        navigatorKey: Utils.mainAppNav,
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(duration: 3, goToPage: WelcomePage()),
          '/welcomepage': (context) => WelcomePage(),
          '/mainpage': (context) => MainPage(),
          '/selectedcategorypage': (context) => SelectedCategoryPage(),
          '/detailspage': (context) => DetailsPage(),
          '/mappage': (context) => MapPage(),
          '/onboardingpage': (context) => OnboardingPage(),
        },
      )));
}
