import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';
import 'package:marketonline/helpers/utils.dart';
import 'package:marketonline/services/cartservices.dart';
import 'package:provider/provider.dart';

class CategoryBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
            offset: Offset.zero)
      ]),
      height: 100,
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
                color: Colors.white,
                child: IconButton(
                    splashColor: Colors.grey[100],
                    highlightColor: Colors.grey[100],
                    icon:
                        Icon(Icons.favorite, color: AppColors.SECUNDARY_COLOR),
                    onPressed: () {})),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Material(
                color: Colors.white,
                child: InkWell(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  onTap: () {
                    Utils.mainListNav.currentState!
                        .pushReplacementNamed('/mainpage/shoppinglistpage');
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Consumer<CartService>(
                      builder: (context, cart, child) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart,
                                color: AppColors.SECUNDARY_COLOR),
                            Visibility(
                                visible: cart.items.length > 0,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    cart.items.length.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.SECUNDARY_COLOR),
                                  ),
                                ))
                          ],
                        );
                      },
                    ),
                  ),
                )),
          ),
          ClipOval(
            child: Material(
                color: Colors.white,
                child: IconButton(
                    splashColor: Colors.grey[100],
                    highlightColor: Colors.grey[100],
                    icon:
                        Icon(Icons.pin_drop, color: AppColors.SECUNDARY_COLOR),
                    onPressed: () {})),
          ),
          ClipOval(
            child: Material(
                color: Colors.white,
                child: IconButton(
                    splashColor: Colors.grey[100],
                    highlightColor: Colors.grey[100],
                    icon:
                        Icon(Icons.settings, color: AppColors.SECUNDARY_COLOR),
                    onPressed: () {})),
          ),
        ],
      ),
    );
  }
}
