import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/models/categorypart.dart';
import 'package:marketonline/models/subcategory.dart';
import 'package:marketonline/pages/category_list_page.dart';
import 'package:marketonline/pages/mappage.dart';
import 'package:marketonline/widgets/categoryicon.dart';
import 'package:marketonline/widgets/categorypartlist.dart';
import 'package:marketonline/widgets/main_appbar.dart';
import 'package:marketonline/widgets/themebutton.dart';
import 'package:marketonline/widgets/unitpricewidget.dart';

class DetailsPage extends StatefulWidget {
  int amount = 0;
  double price = 15.0;
  double cost = 0.0;
  SubCategory? subCategory;

  DetailsPage({this.subCategory});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/imgs/' +
                                widget.subCategory!.imgName! +
                                '.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned.fill(
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent
                        ]))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryIcon(
                              color: widget.subCategory!.color,
                              iconName: widget.subCategory!.icon,
                              size: 50,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Picanha',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: widget.subCategory!.color,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text('79.90 / kg',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        )))
                              ],
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      right: 20,
                      top: 100,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 5, left: 15, right: 15, bottom: 8),
                        decoration: BoxDecoration(
                            color: AppColors.SECUNDARY_COLOR,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  blurRadius: 20,
                                  offset: Offset.zero)
                            ]),
                        child: Row(children: [
                          Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Icon(Icons.shopping_cart,
                              color: Colors.white, size: 15)
                        ]),
                      )),
                  MainAppBar(
                    themeColor: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CategoryPartList(subCategory: widget.subCategory),
                  UnitPriceWidget(),
                  ThemeButton(
                    label: 'Adicionar ao Carrinho',
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    onClick: () {},
                  ),
                  ThemeButton(
                    label: 'Localização do Produto',
                    icon: Icon(Icons.location_pin, color: Colors.white),
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapPage(subCategory: widget.subCategory)));
                    },
                    color: AppColors.DARK_BLUE,
                    highlight: Color.fromARGB(255, 102, 100, 139),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
