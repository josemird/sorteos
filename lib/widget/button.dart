import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppy3/config/imports.dart';

class ButtonCustom extends StatefulWidget {
  final String texto;
  final String iconDerecha;
  final double? width;
  final double? height;
  final Color? colorBackground;
  final Color? colorText;
  final Color? colorBorde;
  final Color? colorHover;
  final Color? colorPressed;
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
    this.colorHover,
    this.colorPressed,
  });


  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {

  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = widget.colorBackground!;

    if (isPressed) {

      backgroundColor = widget.colorPressed ?? widget.colorBackground!;

    } else if (isHovered) {

      backgroundColor = widget.colorHover ?? widget.colorBackground!;

    }

    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      clipBehavior: Clip.antiAlias,

      child: MouseRegion(

        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),

        child: TextButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            minimumSize: Size(0, widget.height ?? 55),
            side: widget.colorBorde != null
                ? BorderSide(color: widget.colorBorde ?? Colors.black, style: BorderStyle.solid)
                : null,
          ),

          onPressed: () {

            setState(() => isPressed = true);
            Future.delayed(Duration(milliseconds: 100), () {
              setState(() => isPressed = false);

            });

            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          },
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              if (widget.image != null) ...[

                widget.image!,
                SizedBox(width: 8),

              ],

              if (widget.iconDerecha.isNotEmpty)
                SizedBox(

                  width: 20,
                  child: SvgPicture.asset(
                    widget.iconDerecha,
                    width: 20,
                    height: 20,

                  ),
                ),
              Expanded(

                child: Text(

                  widget.texto,
                  style: TextStyle(color: widget.colorText),
                  textAlign: TextAlign.center,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
