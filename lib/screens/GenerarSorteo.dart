import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/config/styles/text_styles.dart';
import 'package:shoppy3/function/mostrarGanador.dart';
import 'package:shoppy3/widget/button.dart';
import 'package:shoppy3/widget/customBackAppBar.dart';
import 'package:shoppy3/widget/espacio.dart';

class GenerarSorteoPage extends StatelessWidget {
  final String titulo;
  final List<String> participantes;
  final int suplentes;
  final bool habilitarTop; // Añadimos habilitarTop aquí

  const GenerarSorteoPage({
    super.key,
    required this.titulo,
    required this.participantes,
    required this.suplentes,
    this.habilitarTop = true, // Valor predeterminado de habilitarTop
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final participantesConContador = obtenerListaConContador(participantes);

    return Scaffold(
      appBar: CustomBackAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 50),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextoTitulo("Título"),
                        Espacio(ESPACIO_PEQUENO),
                        TextoCustom(
                          titulo,
                          color: COLOR_ACCENT,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        Espacio(ESPACIO_MEDIANO),
                        TextoTitulo("Participantes"),
                        Espacio(ESPACIO_PEQUENO),
                        Container(
                          width: screenWidth * 0.55,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: COLOR_ACCENT, width: 1.5),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          height: 250,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int index = 0; index < participantesConContador.length; index++) ...[
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: participantesConContador[index].split(' x')[0],
                                          style: TextStyle(fontSize: 16, color: COLOR_TEXT),
                                        ),
                                        if (int.parse(participantesConContador[index].split(' x')[1]) > 1)
                                          TextSpan(
                                            text: ' x${participantesConContador[index].split(' x')[1]}',
                                            style: TextStyle(fontSize: 16, color: COLOR_ACCENT),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (index < participantesConContador.length - 1)
                                    Container(
                                      height: 1,
                                      color: Colors.grey[300],
                                      margin: EdgeInsets.symmetric(vertical: 8.0),
                                    ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ButtonCustom(
              height: 37,
              width: 100,
              colorHover: COLOR_ACCENT_HOVER,
              colorPressed: COLOR_ACCENT_PRESSED,
              colorText: Colors.white,
              texto: "Ganador",
              onPressed: () {
                mostrarGanador(
                  context,
                  participantes,
                  suplentes,
                  habilitarTop, // Pasamos habilitarTop a la función
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<String> obtenerListaConContador(List<String> participantes) {
    final contador = <String, int>{};

    for (var participante in participantes) {
      if (participante.trim().isNotEmpty) {
        contador[participante] = (contador[participante] ?? 0) + 1;
      }
    }

    final participantesOrdenados = contador.keys.toList()
      ..sort((a, b) {
        int comparison = contador[b]!.compareTo(contador[a]!);
        if (comparison == 0) {
          return a.toLowerCase().compareTo(b.toLowerCase());
        }
        return comparison;
      });

    return participantesOrdenados.map((nombre) => "$nombre x${contador[nombre]}").toList();
  }
}
