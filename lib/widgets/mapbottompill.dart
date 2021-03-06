import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/iconhelper.dart';
import 'package:marketonline/models/subcategory.dart';
import 'package:marketonline/services/categoryselectionservice.dart';
import 'package:marketonline/widgets/categoryicon.dart';
import 'package:provider/provider.dart';

class MapBottomPill extends StatelessWidget {
  MapBottomPill({Key? key, this.subCategory}) : super(key: key);
  SubCategory? subCategory;
  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    this.subCategory = catSelection.selectedSubCategory;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset.zero)
          ]),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/imgs/${this.subCategory!.imgName}.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        bottom: -10,
                        right: -10,
                        child: CategoryIcon(
                            color: this.subCategory!.color,
                            iconName: this.subCategory!.icon,
                            size: 20,
                            padding: 5))
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.subCategory!.name!,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text('Venda por quilo'),
                      Text(
                        '2km de dist??ncia',
                        style: TextStyle(color: this.subCategory!.color),
                      )
                    ],
                  ),
                ),
                Icon(Icons.location_pin,
                    color: this.subCategory!.color, size: 50)
              ],
            ),
          ),
          Container(
              child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/imgs/acougue.jpg'),
                              fit: BoxFit.cover),
                          border: Border.all(
                              color: this.subCategory!.color!, width: 4))),
                  SizedBox(width: 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('JBS',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Estrada Servidei Demarchi\nJBS delivery #335')
                      ])
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
