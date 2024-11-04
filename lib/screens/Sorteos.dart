import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/config/styles/text_styles.dart';
import 'package:shoppy3/screens/GenerarSorteos.dart';
import 'package:shoppy3/widget/button.dart';
import 'package:shoppy3/widget/customAppBar.dart';
import 'package:shoppy3/widget/espacio.dart';
import 'package:shoppy3/widget/loading.dart';
import 'package:shoppy3/widget/textFormField.dart';

class SorteosPage extends StatefulWidget {

  const SorteosPage({super.key});

  @override
  State<SorteosPage> createState() => _SorteosPageState();
}

class _SorteosPageState extends State<SorteosPage> {
  bool cargando = false;
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController participantesController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: CustomAppBar(),

      body: Loading(

        loading: cargando,

        child: ListView(

          padding: EdgeInsets.only(left: 400, right: 400, top: 50, bottom: 50),

          children: [

            Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                Espacio(ESPACIO_GRANDE),

                TextoCustom("Sorteo por Nombres al Azar", fontSize: 25, fontWeight: FontWeight.w800),

                Espacio(ESPACIO_PEQUENO),

                TextoBody("Escoge un ganador al azar de una lista de nombres con nuestra App", color: COLOR_ACCENT),

                Espacio(ESPACIO_MEDIANO),

                TextFormFieldCustom(

                  labelText: "TÍTULO",
                  height: 40,
                  onChanged: (value) => tituloController.text = value,

                ),

                Espacio(ESPACIO_MEDIANO),

                TextFormFieldCustom(

                  labelText: "PARTICIPANTES\n(Separar por comas o saltos de línea)",
                  width: 300,
                  minLines: 7,
                  maxLines: 7,
                  onChanged: (value) => participantesController.text = value,

                ),

                Espacio(ESPACIO_PEQUENO),

                ButtonCustom(

                  height: 25,
                  width: 100,
                  colorText: Colors.white,
                  texto: "Comenzar",
                  onPressed: () {

                    List<String> participantes = participantesController.text.split(RegExp(r',|\n'));
                    goToClear(

                      context,
                      GenerarSorteosPage(

                        titulo: tituloController.text,
                        participantes: participantes,

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
}
