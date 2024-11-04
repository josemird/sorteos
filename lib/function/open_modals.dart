import 'package:flutter/material.dart';
import 'package:shoppy3/widget/snackbar.dart';

//BOTTOMSHEET
openBottomSheet(BuildContext context, StatefulWidget widget,
    {bool noBarrierColor = false,
    Function()? onBack,
    double opacity = 0.1}) async {
  showModalBottomSheet(
      context: context,
      showDragHandle: false,
      isScrollControlled: true,
      isDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      enableDrag: true,
      barrierLabel: "ururur",
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) {
        return widget;
      }).then((value) {
    if (onBack != null) {
      onBack();
    }
  });
}

//DIALOG
openDialog(BuildContext context, StatefulWidget widget,
    {Function()? function}) async {
  showDialog(
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        return widget;
      }).then((value) {
    if (function != null) {
      function();
    }
  });
}

//SNACKBAR
openSnackbar(BuildContext context, String texto, IconData icono,
    {bool error = true}) {
  ScaffoldMessenger.of(context).showSnackBar(snackbar(texto, icono, error));
}
