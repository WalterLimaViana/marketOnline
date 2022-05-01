import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/main.dart';
import 'package:marketonline/pages/category_list_page.dart';
import 'package:marketonline/pages/onboardingpage.dart';
import 'package:marketonline/services/loginservice.dart';
import 'package:marketonline/widgets/iconfont.dart';
import 'package:marketonline/widgets/themebutton.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);

    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/imgs/shopping-venture.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ClipOval(
                    child: Container(
                      width: 180,
                      height: 180,
                      color: AppColors.SECUNDARY_COLOR,
                      alignment: Alignment.center,
                      child: IconFont(
                          iconName: IconFontHelper.LOGOMAIN,
                          color: Colors.white,
                          size: 140),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text('Bem Vindo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
                Text('MarketOnline.\nSeu supermercado, na palma da sua mão',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                SizedBox(height: 50),
                ThemeButton(
                  label: 'Comprar Agora',
                  highlight: AppColors.HIGHTLIGHT_DEFAULT,
                  color: AppColors.SECUNDARY_COLOR,
                  onClick: () {
                    Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                  },
                ),
                ThemeButton(
                  label: 'Introdução',
                  highlight: Colors.blue[900],
                  color: AppColors.DARK_BLUE,
                  onClick: () {
                    Utils.mainAppNav.currentState!.pushNamed('/onboardingpage');
                  },
                ),
                ThemeButton(
                  label: 'Fazer Login',
                  labelColor: AppColors.SECUNDARY_COLOR,
                  color: Colors.transparent,
                  highlight: AppColors.SECUNDARY_COLOR.withOpacity(0.5),
                  borderColor: AppColors.SECUNDARY_COLOR,
                  borderWidth: 4,
                  onClick: () async {
                    bool success = await loginService.signWithGoogle();

                    if (success) {
                      Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                    }
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
