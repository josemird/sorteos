import 'package:flutter/material.dart';
import 'package:shoppy3/config/theme/theme.dart';
import 'package:shoppy3/widget/espacio.dart';

Widget dividerCustom (){

  return Row(

    mainAxisAlignment: MainAxisAlignment.center,

    children: [

      Expanded(

        child: Container(

          height: 1.0,
          color: Colors.grey,
        ),

      ),

      Espacio(ESPACIO_PEQUENO),

      Icon(
        Icons.circle_outlined,
        size: 9.0,
        color: COLOR_ACCENT
      ),

      Espacio(ESPACIO_PEQUENO),

      Expanded(

        child: Container(

          height: 1.0,
          color: Colors.grey,
        ),

      ),

    ],
  );

}