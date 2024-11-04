import 'package:flutter/material.dart';

const double radiusSmall = 10;
const double radiusBig = 30;

//BORDERS
BorderRadius BorderRadiusAllCustom({double radius = radiusSmall}){

  return BorderRadius.circular(radius);

}

//SHADOWS
BoxShadow BoxShadowCustom(){

  return BoxShadow(
    color: Colors.black.withOpacity(0.05),
    spreadRadius: 1,
    blurRadius: 20,
    offset: const Offset(0, 0), // changes position of shadow
  );

}





