import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/main.dart';
import 'package:marketonline/pages/category_list_page.dart';
import 'package:marketonline/widgets/themebutton.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          iconName: IconFontHelper.LOGO,
                          color: Colors.white,
                          size: 100),
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
                  onClick: () {},
                ),
                ThemeButton(
                  label: 'Fazer Login',
                  labelColor: AppColors.SECUNDARY_COLOR,
                  color: Colors.transparent,
                  highlight: AppColors.SECUNDARY_COLOR.withOpacity(0.5),
                  borderColor: AppColors.SECUNDARY_COLOR,
                  borderWidth: 4,
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryListPage(),
                        ));
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
