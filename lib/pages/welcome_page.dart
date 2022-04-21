import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/main.dart';

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
                          iconName: IconFontHelper.FISH,
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: FlatButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: AppColors.SECUNDARY_COLOR,
                      padding: EdgeInsets.all(25),
                      child: Text('Comprar Agora',
                          style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: AppColors.SECUNDARY_COLOR.withOpacity(0.2),
                        highlightColor:
                            AppColors.SECUNDARY_COLOR.withOpacity(0.2),
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text('Fazer Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.SECUNDARY_COLOR,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: AppColors.SECUNDARY_COLOR, width: 4)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
