import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/main.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color? themeColor;
  bool? showProfilePic;

  MainAppBar(
      {this.themeColor = AppColors.SECUNDARY_COLOR,
      this.showProfilePic = true});

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: IconFont(
          iconName: IconFontHelper.CESTA,
          color: widget.themeColor,
          size: 40,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
      actions: [
        Opacity(
          opacity: widget.showProfilePic! ? 1.0 : 0,
          child: Container(
              margin: EdgeInsets.only(right: 5),
              padding: EdgeInsets.all(10),
              child: ClipOval(
                  child: Image.asset(
                'assets/imgs/shopping-venture.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ))),
        )
      ],
    );
  }
}
