import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/screens/GenerarSorteos.dart';
import 'package:shoppy3/screens/Sorteos.dart';
import 'package:shoppy3/widget/customAppBar.dart';
import 'package:shoppy3/widget/espacio.dart';
import 'package:shoppy3/widget/loading.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool cargando = false;

  PageController pageController = PageController(initialPage: 0);
  int _paginaActual = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Colors.white,
      // appBar: CustomAppBar(),
      //
      // body: Container(
      //
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //
      //   child: Loading(
      //
      //     loading: cargando,
      //
      //     child: PageView(
      //       pageSnapping: false,
      //       allowImplicitScrolling: false,
      //       physics: const NeverScrollableScrollPhysics(),
      //       controller: pageController,
      //       children: [SorteosPage()],
      //     ),
      //   ),
      // ),
    );
  }
}
