import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/models/subcategory.dart';
import 'package:marketonline/widgets/categoryicon.dart';
import 'package:marketonline/widgets/main_appbar.dart';

class DetailsPage extends StatefulWidget {
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
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text('Selecione a parte que deseja:')),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.subCategory!.parts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.all(15),
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: AssetImage('assets/imgs/' +
                                            widget.subCategory!.parts[index]
                                                .imgName! +
                                            '.jpg'),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: Offset.zero,
                                        blurRadius: 10,
                                      )
                                    ])),
                            Container(
                                margin: EdgeInsets.only(left: 25),
                                child: Text(
                                  widget.subCategory!.parts[index].name!,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: widget.subCategory!.color),
                                ))
                          ],
                        );
                      },
                    ),
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
