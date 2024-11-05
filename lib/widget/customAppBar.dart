import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/config/styles/text_styles.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final Color textColor;

  const CustomAppBar({
    Key? key,
    this.title = 'Sorteos',
    this.backgroundColor = COLOR_BACKGROUND,
    this.actions,
    this.padding = const EdgeInsets.all(0),
    this.textColor = COLOR_TEXT,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  double _letterSpacing = 3;

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: widget.padding!,
      child: AppBar(

        title: MouseRegion(

          onEnter: (_) => setState(() => _letterSpacing = 6),
          onExit: (_) => setState(() => _letterSpacing = 3),
          child: AnimatedDefaultTextStyle(

            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            style: estiloTitulo().copyWith(
              color: widget.textColor,
              letterSpacing: _letterSpacing,

            ),

            child: Text(widget.title),

          ),
        ),

        toolbarHeight: 75,
        backgroundColor: widget.backgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: widget.actions,

      ),
    );
  }
}
