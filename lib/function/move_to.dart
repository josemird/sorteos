import 'package:flutter/material.dart';

goTo(BuildContext context, page, {Function()? onBack}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  ).then((value) {
    if (onBack != null) {
      onBack();
    }
  });
}

goToNoBack(BuildContext context, page, {Function()? onBack}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  ).then((value) {
    if (onBack != null) {
      onBack();
    }
  });
}

goToClear(BuildContext context, page, {Function()? onBack}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => page,
    ),
    (route) => false,
  ).then((value) {
    if (onBack != null) {
      onBack();
    }
  });
}
