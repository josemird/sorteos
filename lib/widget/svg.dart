import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppy3/config/theme/theme.dart';

Widget SvgCustom({String icon = "", String fullIcon = "", Color color = COLOR_ACCENT, BlendMode blendMode = BlendMode.srcIn, double size = 24}) {

  return SvgPicture.network(
      fullIcon.isNotEmpty ? fullIcon : "assets/icons/$icon.svg",
      height: size,
      width: size,
      colorFilter: ColorFilter.mode(
          color,
          blendMode
      )
  );

}

