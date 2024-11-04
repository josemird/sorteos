import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/config/styles/text_styles.dart';
import 'package:shoppy3/function/mostrar_ganador.dart';
import 'package:shoppy3/widget/button.dart';
import 'package:shoppy3/widget/customAppBar.dart';
import 'package:shoppy3/widget/espacio.dart';
import 'package:shoppy3/function/mostrar_ganador.dart';


class GenerarSorteosPage extends StatelessWidget {
  final String titulo;
  final List<String> participantes;

  const GenerarSorteosPage({
    super.key,
    required this.titulo,
    required this.participantes,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: CustomAppBar(),
      backgroundColor: Colors.white,

      body: Padding(

        padding: const EdgeInsets.only(left: 400, right: 400, top: 50, bottom: 50),

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

                        TextoBody(titulo, color: COLOR_ACCENT, fontWeight: FontWeight.bold),

                        Espacio(ESPACIO_MEDIANO),

                        TextoTitulo("Participantes"),

                        Espacio(ESPACIO_PEQUENO),

                        Container(

                          width: 450,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: COLOR_ACCENT, width: 1.5),
                            borderRadius: BorderRadius.circular(5.0),

                          ),
                          height: 210,
                          child: SingleChildScrollView(

                            child: Column(

                              children: [

                                for (int i = 0; i < participantes.length && i < 10; i++) ...[
                                  Text(

                                    participantes[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),

                                  ),

                                  if (i < participantes.length - 1 && i < 9)
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

            Espacio(ESPACIO_MEDIANO),

            ButtonCustom(

              height: 30,
              width: 100,
              colorText: Colors.white,
              texto: "Ganador",
              onPressed: () {

                mostrarGanador(context, participantes);

              },
            ),
          ],
        ),
      ),
    );
  }
}
