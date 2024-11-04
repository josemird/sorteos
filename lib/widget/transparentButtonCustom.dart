import 'package:flutter/material.dart';
import 'package:shoppy3/config/theme/theme.dart';

ButtonStyle estiloTransparente() {
  return TextButton.styleFrom(
    backgroundColor: COLOR_BACKGROUND.withOpacity(0),
    padding: EdgeInsets.zero,
    splashFactory: NoSplash.splashFactory,
    foregroundColor: COLOR_BACKGROUND.withOpacity(0),
    surfaceTintColor: COLOR_BACKGROUND.withOpacity(0),
    disabledForegroundColor: COLOR_BACKGROUND.withOpacity(0),
    disabledBackgroundColor: COLOR_BACKGROUND.withOpacity(0),
    shadowColor: COLOR_BACKGROUND.withOpacity(0),
    side: BorderSide.none,
    elevation: 0,
  );
}

class TransparentButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  TransparentButtonCustom({required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: estiloTransparente(),
        child: child,
        );
    }
}
