import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';

class MapUserBadge extends StatelessWidget {
  bool? isSelected;

  MapUserBadge({this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 10, bottom: 18, left: 20, right: 20),
      decoration: BoxDecoration(
          color: this.isSelected! ? AppColors.SECUNDARY_COLOR : Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset.zero)
          ]),
      child: Row(
        children: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/shopping-venture.jpg'),
                      fit: BoxFit.cover),
                  border: Border.all(
                      color: this.isSelected!
                          ? Colors.white
                          : AppColors.SECUNDARY_COLOR,
                      width: 1))),
          SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Walter',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: this.isSelected! ? Colors.white : Colors.grey)),
              Text(
                'Minha Localização',
                style: TextStyle(
                    color: this.isSelected!
                        ? Colors.white
                        : AppColors.SECUNDARY_COLOR),
              )
            ],
          )),
          Icon(Icons.location_pin,
              color:
                  this.isSelected! ? Colors.white : AppColors.SECUNDARY_COLOR,
              size: 40)
        ],
      ),
    );
  }
}