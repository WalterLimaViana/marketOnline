import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/services/loginservice.dart';
import 'package:marketonline/widgets/iconfont.dart';
import 'package:provider/provider.dart';

class SideMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    bool? userLoggedIn = loginService.loggedInUserModel != null;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        color: AppColors.SECUNDARY_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () async {
                  if (userLoggedIn) {
                    loginService.signOut();
                    Utils.mainAppNav.currentState!
                        .pushReplacementNamed('/welcomepage');
                  } else {
                    bool success = await loginService.signWithGoogle();
                    if (success) {
                      Utils.mainAppNav.currentState!
                          .pushReplacementNamed('/mainpage');
                    }
                  }
                },
                child: Row(
                  children: [
                    Icon(userLoggedIn ? Icons.logout : Icons.login,
                        color: Colors.white, size: 20),
                    SizedBox(width: 10),
                    Text(userLoggedIn ? 'Sign Out' : 'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 20))
                  ],
                )),
            IconFont(
                iconName: IconFontHelper.CESTA, size: 70, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
