import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/models/subcategory.dart';
import 'package:marketonline/services/categoryselectionservice.dart';
import 'package:provider/provider.dart';

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
    SubCategory? subCategory = catSelection.selectedSubCategory;

    widget.themeColor = subCategory.themeColor;
    widget.price = subCategory.price;
    widget.unit = subCategory.unit;

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
                    onTap: widget.amount < 20
                        ? () {
                            //increment
                            setState(() {
                              widget.amount++;
                              widget.cost = widget.price * widget.amount;
                            });
                          }
                        : null,
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 50,
                      color: AppColors.MEATS,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: widget.amount.toString(),
                            style: TextStyle(fontSize: 40)),
                        TextSpan(text: ' Kg', style: TextStyle(fontSize: 20))
                      ])),
                    ),
                  )),
                  GestureDetector(
                    onTap: widget.amount > 0
                        ? () {
                            //decrement
                            setState(() {
                              widget.amount--;
                              widget.cost = widget.price * widget.amount;
                            });
                          }
                        : null,
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: 50,
                      color: Colors.grey,
                    ),
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
