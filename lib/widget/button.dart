import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppy3/config/imports.dart';

//ES MAS CORRECTO PARA FLUTTER
class ButtonCustom extends StatelessWidget {

  final String texto;
  final String iconDerecha;
  final double? width;
  final double? height;
  final Color? colorBackground;
  final Color? colorText;
  final Color? colorBorde;
  final Function()? onPressed;
  final Widget? image;

  const ButtonCustom({
    super.key,
    this.texto = "",
    this.iconDerecha = "",
    this.width = 355,
    this.height = 55,
    this.onPressed,
    this.colorBackground = COLOR_ACCENT,
    this.colorText = COLOR_TEXT_BUTTONS,
    this.colorBorde,
    this.image,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      clipBehavior: Clip.antiAlias,
      child: TextButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colorBackground,
            minimumSize: Size(0, height ?? 55),
            side: colorBorde != null
                ? BorderSide(color: colorBorde ?? Colors.black, style: BorderStyle.solid)
                : null,
        ),
        onPressed: () {
          if(onPressed!=null){
            onPressed!();
          }

        },

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null) ...[
              image!,
              SizedBox(width: 8),
            ],
            if (iconDerecha.isNotEmpty)
              SizedBox(
                width: 20,
                child: SvgPicture.asset(
                    iconDerecha,
                  width: 20,
                  height: 20,
                ),
              ),
            Expanded(
              child: Text(
                texto,
                style: TextStyle(color: colorText),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
