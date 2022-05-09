import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/unitenums.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/models/subcategory.dart';
import 'package:marketonline/services/categoryselectionservice.dart';
import 'package:provider/provider.dart';

const int MAX_VALUE = 20;
const int MIN_VALUE = 0;

class UnitPriceWidget extends StatefulWidget {
  Color? themeColor;
  int amount = 0;
  double price = 0.0;
  WeightUnits? unit;
  double cost = 0.0;

  @override
  State<UnitPriceWidget> createState() => _UnitPriceWidgetState();
}

class _UnitPriceWidgetState extends State<UnitPriceWidget> {
  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
        Provider.of<CategorySelectionService>(context);
    SubCategory subCategory = catSelection.selectedSubCategory!;

    // widget.themeColor = subCategory!.themeColor;
    // widget.price = subCategory.price;
    // widget.unit = subCategory.unit;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: 'Unidade: '),
            TextSpan(
                text: 'Quilo ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '(máx. 20)', style: TextStyle(fontSize: 12))
          ])),
        ),
        Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset.zero,
                    color: Colors.black.withOpacity(0.1))
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: catSelection.subCategoryAmount < MAX_VALUE
                        ? () {
                            catSelection.incrementSubCategoryAmount(context);
                          }
                        : null,
                    child: Icon(Icons.add_circle_outline,
                        size: 50,
                        color: catSelection.subCategoryAmount < MAX_VALUE
                            ? subCategory.color
                            : subCategory.color!.withOpacity(0.2)),
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<CategorySelectionService>(
                            builder: (context, cat, child) {
                              return Center(
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: catSelection.subCategoryAmount
                                          .toString(),
                                      style: TextStyle(fontSize: 40)),
                                  TextSpan(
                                      text: Utils.weightUnitToString(
                                          widget.unit!),
                                      style: TextStyle(fontSize: 20))
                                ])),
                              );
                            },
                          ))),
                  GestureDetector(
                    onTap: catSelection.subCategoryAmount < MIN_VALUE
                        ? () {
                            catSelection.decrementSubCategoryAmount(context);
                          }
                        : null,
                    child: Icon(Icons.remove_circle_outline,
                        size: 50,
                        color: catSelection.subCategoryAmount > MIN_VALUE
                            ? subCategory.color
                            : subCategory.color!.withOpacity(0.2)),
                  ),
                ])),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: 'Preço: '),
                TextSpan(
                    text: '\$${widget.price} / kg',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ])),
              Text(
                '\$${widget.cost}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
