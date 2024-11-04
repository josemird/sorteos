import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/config/styles/text_styles.dart';
import 'package:shoppy3/screens/Home.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final Color textColor;

  const CustomBackAppBar({
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20.0,
          ),
          onPressed: () {
            goToClear(

                context,
                HomePage(),
            );

            },
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
