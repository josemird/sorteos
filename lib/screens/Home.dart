import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/config/styles/text_styles.dart';
import 'package:shoppy3/screens/GenerarSorteo.dart';
import 'package:shoppy3/widget/button.dart';
import 'package:shoppy3/widget/customAppBar.dart';
import 'package:shoppy3/widget/espacio.dart';
import 'package:shoppy3/widget/loading.dart';
import 'package:shoppy3/widget/opcionesAvanzadas.dart';
import 'package:shoppy3/widget/textFormField.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool cargando = false;
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController participantesController = TextEditingController();
  String? nombreArchivo;
  bool checkSuplentes = true;



  // Variables para los nuevos campos
  int suplentes = 10;
  bool habilitarTop = true;



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Loading(

        loading: cargando,

        child: ListView(

          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: 50),

          children: [

            Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                Espacio(ESPACIO_MEDIANO),

                TextoCustom("Sorteo por Nombres al Azar", fontSize: 25, fontWeight: FontWeight.w800),

                Espacio(ESPACIO_PEQUENO),

                TextoBody("Escoge un ganador al azar de una lista de nombres con nuestra App", color: COLOR_ACCENT),

                Espacio(ESPACIO_PEQUENO),

                OpcionesAvanzadasWidget(
                  suplentes: suplentes,
                  habilitarTop: habilitarTop,
                  checkSuplentes: checkSuplentes,
                  onSuplentesChanged: (newSuplentes) {
                    setState(() {
                      suplentes = newSuplentes;
                    });
                  },
                  onTopChanged: (value) {
                    setState(() {
                      habilitarTop = value;
                    });
                  },
                  onCheckSuplentesChanged: (value) {
                    setState(() {
                      checkSuplentes = value ?? false;
                      if (checkSuplentes) {
                        suplentes = 0;
                      } else {
                        suplentes = 10;
                      }
                    });
                  },
                ),


                Espacio(ESPACIO_PEQUENO),

                TextFormFieldCustom(

                  labelText: "TÍTULO",
                  height: 40,
                  onChanged: (value) => tituloController.text = value,

                ),

                Espacio(ESPACIO_PEQUENO),

                TextFormFieldCustom(

                  labelText: "PARTICIPANTES\n(Separar con saltos de línea)",
                  width: screenWidth * 0.45,
                  minLines: 7,
                  maxLines: 7,
                  controller: participantesController,
                  onChanged: (value) => participantesController.text = value,

                ),

                Espacio(ESPACIO_EXTRAPEQUENO),
                if (nombreArchivo != null)
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Text(

                        'Cargado: $nombreArchivo',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: COLOR_TEXT),

                      ),

                      Espacio(ESPACIO_EXTRAPEQUENO),

                      IconButton(

                        icon: Icon(Icons.close, color: Colors.red),

                        onPressed: () {

                          setState(() {
                            participantesController.clear();
                            nombreArchivo = null;

                          });

                        },
                      ),
                    ],
                  ),

                ButtonCustom(

                  height: 20,
                  width: 140,
                  colorBackground: COLOR_BACKGROUND,
                  colorText: COLOR_ACCENT,
                  colorHover: COLOR_BACKGROUND_SECONDARY,
                  colorPressed: COLOR_BACKGROUND_SECONDARY,
                  texto: "Cargar Archivo",

                  onPressed: (){

                    pickFile();

                  }

                ),


                Espacio(ESPACIO_PEQUENO),

                ButtonCustom(

                  height: 37,
                  width: 100,
                  colorHover: COLOR_ACCENT_HOVER,
                  colorPressed: COLOR_ACCENT_PRESSED,
                  colorText: Colors.white,
                  texto: "Comenzar",
                  onPressed: () {

                    List<String> participantes = participantesController.text.split(RegExp(r',|\n'));
                    goToClear(
                      context,
                      GenerarSorteoPage(
                        titulo: tituloController.text,
                        participantes: participantes,
                        suplentes: suplentes,
                      ),

                    );

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickFile() async {
    if (nombreArchivo != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ya se ha cargado un archivo. Por favor, quítalo para cargar uno nuevo.')),
      );
      return;
    }

    final input = html.FileUploadInputElement();
    input.accept = '.txt';
    input.click();

    input.onChange.listen((e) async {
      final reader = html.FileReader();
      reader.readAsText(input.files![0]);

      reader.onLoadEnd.listen((e) {
        final fileContent = reader.result as String;

        List<String> nuevosParticipantes = fileContent.split('\n').map((line) => line.trim()).toList();

        setState(() {
          participantesController.text = nuevosParticipantes.join('\n');
          nombreArchivo = input.files![0].name;
        });
      });
    });
  }

  void onCheckSuplentesChanged(bool value) {
    setState(() {
      checkSuplentes = value;
      if (checkSuplentes) {
        suplentes = 0;
      }
    });
  }


}
