import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/config/variables/variables.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;

  const CustomBackAppBar({
    Key? key,
    this.title = 'Shoppy',
    this.backgroundColor = COLOR_BACKGROUND,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Shoppy'),
      toolbarHeight: 75,
      backgroundColor: COLOR_BACKGROUND_SECONDARY,
      titleTextStyle: estiloTitulo(),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 35.0,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
