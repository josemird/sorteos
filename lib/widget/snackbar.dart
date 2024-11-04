import 'package:flutter/material.dart';
import 'package:shoppy3/config/styles/text_styles.dart';
import 'package:shoppy3/config/theme/theme.dart';
import 'package:shoppy3/widget/espacio.dart';

SnackBar snackbar(String texto, IconData icono, bool error){

  return SnackBar(

    behavior: SnackBarBehavior.fixed,
    elevation: 10,
    backgroundColor: error? COLOR_ERROR : COLOR_ACCENT,

    duration: const Duration(seconds: 3),

    content: Row(

      children: [

        Icon(
          icono,
          size: 18,
          color: COLOR_BACKGROUND,
        ),

        Espacio(ESPACIO_PEQUENO),

        Expanded(child: TextoCaption(texto, color: COLOR_BACKGROUND, maxlines: 2),)

      ],

    ),
  );
}
