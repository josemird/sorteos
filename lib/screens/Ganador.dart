import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/widget/button.dart';
import 'package:shoppy3/widget/customAppBar.dart';
import 'package:shoppy3/widget/espacio.dart';


class GanadorPage extends StatelessWidget {
  final String ganador;

  const GanadorPage({Key? key, required this.ganador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[900],
      appBar: CustomAppBar(),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text(

              "Ha Ganado:",
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,

            ),

            Espacio(ESPACIO_MEDIANO),

            Text(

              ganador,
              style: TextStyle(color: COLOR_ACCENT_SECONDARY, fontSize: 34, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,

            ),

            Espacio(ESPACIO_GRANDE),
            Espacio(ESPACIO_EXTRAPEQUENO),


            ButtonCustom(

              height: 37,
              width: 100,
              colorHover: COLOR_ACCENT_HOVER,
              colorPressed: COLOR_ACCENT_PRESSED,
              colorText: Colors.white,
              texto: "Cerrar",

              onPressed: () {

                Navigator.of(context).pop();

              },
            ),


          ],
        ),

      ),

    );
  }
}

void mostrarGanador(BuildContext context, List<String> participantes) {

  if (participantes.isEmpty) return;

  final randomIndex = Random().nextInt(participantes.length);

  final ganador = participantes[randomIndex];

  Navigator.of(context).push(

    MaterialPageRoute(
      builder: (context) => GanadorPage(ganador: ganador),

    ),
  );
}
