import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/widget/customAppBar.dart';

class GanadorPage extends StatelessWidget {
  final String ganador;

  const GanadorPage({Key? key, required this.ganador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            SizedBox(height: 20),
            Text(
              ganador,
              style: TextStyle(color: COLOR_ACCENT_SECONDARY, fontSize: 34, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cerrar",
                style: TextStyle(color: Colors.white),
              ),
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
