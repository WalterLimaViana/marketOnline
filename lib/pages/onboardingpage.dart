import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/helpers/util.dart';
import 'package:marketonline/main.dart';
import 'package:marketonline/models/onboardingcontent.dart';
import 'package:marketonline/pages/category_list_page.dart';
import 'package:marketonline/widgets/iconfont.dart';
import 'package:marketonline/widgets/main_appbar.dart';
import 'package:marketonline/widgets/themebutton.dart';

class Onboardingpage extends StatefulWidget {
  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  List<Onboardingcontent> _content = Utils.getOnboarding();

  int pageIndex = 0;

  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: PageView(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  pageIndex = page;
                });
              },
              children: List.generate(
                  _content.length,
                  (index) => Container(
                        padding: EdgeInsets.all(40),
                        margin: EdgeInsets.only(
                            left: 40, right: 40, top: 40, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.SECUNDARY_COLOR
                                      .withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: Offset.zero)
                            ]),
                        child: Column(children: [
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconFont(
                                    color: AppColors.SECUNDARY_COLOR,
                                    iconName: IconFontHelper.CESTA,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Image.asset(
                                    'assets/imgs/${_content[index].img}.png'),
                                SizedBox(height: 40),
                                Text(_content[index].message!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.SECUNDARY_COLOR,
                                        fontSize: 18))
                              ],
                            ),
                          ),
                          Visibility(
                            visible: index == _content.length - 1,
                            child: ThemeButton(
                                onClick: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryListPage()));
                                },
                                label: 'Entrar Agora',
                                color: AppColors.DARK_BLUE,
                                highlight: AppColors.DARKER_BLUE),
                          )
                        ]),
                      )),
            )),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    _content.length,
                    ((index) => GestureDetector(
                          onTap: () {
                            _controller!.animateTo(
                                MediaQuery.of(context).size.width * index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.SECUNDARY_COLOR,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 6,
                                      color: pageIndex == index
                                          ? Colors.transparent
                                          : Theme.of(context).canvasColor))),
                        )))),
            SizedBox(height: 20),
            ThemeButton(
              onClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryListPage()));
              },
              label: 'Pular Introdução',
            )
          ],
        ),
      ),
    );
  }
}
