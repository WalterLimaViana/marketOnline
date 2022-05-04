import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/main.dart';
import 'package:marketonline/widgets/iconfont.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  String? goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () async {
      FirebaseApp app = await Firebase.initializeApp();
      Utils.mainAppNav.currentState!.pushNamed(this.goToPage!);
    });
    return Scaffold(
      body: Container(
          color: Color.fromARGB(255, 61, 187, 245),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: IconFont(
                    color: Colors.white,
                    iconName: IconFontHelper.CESTA,
                    size: 80),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white.withOpacity(0.5)),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
