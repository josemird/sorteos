import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/config/styles/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: AppBar(
        title: Text(
          title,
          style: estiloTitulo().copyWith(color: textColor, letterSpacing: 3),
        ),
        toolbarHeight: 75,
        backgroundColor: backgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
