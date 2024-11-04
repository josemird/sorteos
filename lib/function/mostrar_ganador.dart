import 'dart:math';
import 'package:flutter/material.dart'; // Asegúrate de importar Material

void mostrarGanador(BuildContext context, List<String> participantes) {

  if (participantes.isEmpty) return;

  final randomIndex = Random().nextInt(participantes.length);
  final ganador = participantes[randomIndex];


  showDialog(

    context: context,
    builder: (BuildContext context) {

      return AlertDialog(

        backgroundColor: Colors.black,

        title: Text(

          "Ganador", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,

        ),

        content: Text(

          "El ganador es: \n \n $ganador", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,

        ),

        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              TextButton(

                onPressed: () {

                  Navigator.of(context).pop();

                },

                child: Text(

                  "Cerrar", style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],

      );
    },
  );
}
