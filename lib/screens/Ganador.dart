import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/widget/button.dart';
import 'package:shoppy3/widget/customAppBar.dart';
import 'package:shoppy3/widget/espacio.dart';


class GanadorPage extends StatefulWidget {
  final String ganador;
  final List<String> suplentes;

  const GanadorPage({Key? key, required this.ganador, required this.suplentes}) : super(key: key);

  @override
  _GanadorPageState createState() => _GanadorPageState();
}

class _GanadorPageState extends State<GanadorPage> {
  @override
  void initState() {
    super.initState();
    print("El ganador es: ${widget.ganador}");
    print("Los suplentes son: ${widget.suplentes.join(', ')}"); // Imprimir suplentes
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[900],
      appBar: CustomAppBar(),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text("Ha Ganado:", style: TextStyle(color: Colors.white, fontSize: 24), textAlign: TextAlign.center),

            Espacio(ESPACIO_MEDIANO),

            Text(widget.ganador, style: TextStyle(color: COLOR_ACCENT_SECONDARY, fontSize: 34, fontWeight: FontWeight.bold), textAlign: TextAlign.center),

            Espacio(ESPACIO_GRANDE),

            Text(
              "Suplentes:",
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            ),

            Espacio(ESPACIO_PEQUENO),

            ...widget.suplentes.map((suplente) => Text(
              suplente,
              style: TextStyle(color: Colors.deepPurpleAccent[100], fontSize: 18),
              textAlign: TextAlign.center,
            )).toList(),

            Espacio(ESPACIO_GRANDE),

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



