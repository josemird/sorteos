import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        onTap(index);

      },

      selectedItemColor: Colors.tealAccent,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(color: Colors.tealAccent),
      unselectedLabelStyle: TextStyle(color: Colors.white),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 13,
      unselectedFontSize: 13,
      iconSize: 30,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: COLOR_ACCENT,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_rounded, color: COLOR_ACCENT,),
          label: 'Compare',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: COLOR_ACCENT,),
          label: 'Profile',
        ),
      ],
    );
  }
}
