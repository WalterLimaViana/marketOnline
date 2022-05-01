import 'package:flutter/material.dart';
import 'package:marketonline/helpers/appcolors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Row(
            children: [
              Icon(
                Icons.settings,
                color: AppColors.SECUNDARY_COLOR,
              ),
              SizedBox(width: 10),
              Text('Configurações',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Expanded(
            child: Container(),
          )
        ]));
  }
}
