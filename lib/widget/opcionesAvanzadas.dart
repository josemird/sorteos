import 'package:flutter/material.dart';

class OpcionesAvanzadasWidget extends StatelessWidget {
  final int suplentes;
  final bool habilitarTop;
  final bool checkSuplentes;
  final ValueChanged<int> onSuplentesChanged;
  final ValueChanged<bool> onTopChanged;
  final ValueChanged<bool?> onCheckSuplentesChanged;

  OpcionesAvanzadasWidget({
    required this.suplentes,
    required this.habilitarTop,
    required this.checkSuplentes,
    required this.onSuplentesChanged,
    required this.onTopChanged,
    required this.onCheckSuplentesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: ExpansionTile(
        title: Text(
          "Opciones avanzadas",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: checkSuplentes,
                    onChanged: (bool? value) {
                      // Se actualiza el valor de suplentes según el checkbox
                      onCheckSuplentesChanged(value);
                      if (value == true) {
                        onSuplentesChanged(10); // Establecer el valor de suplentes a 10
                      } else {
                        onSuplentesChanged(0); // Establecer el valor de suplentes a 0
                      }
                    },
                  ),
                  Text("Suplentes"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: checkSuplentes // Habilitar si el checkbox está marcado
                            ? () {
                          if (suplentes > 0) {
                            onSuplentesChanged(suplentes - 1);
                          }
                        }
                            : null,
                      ),
                      Text('$suplentes'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: checkSuplentes // Habilitar si el checkbox está marcado
                            ? () {
                          onSuplentesChanged(suplentes + 1);
                        }
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Top 3"),
                  SizedBox(width: 8),
                  Switch(
                    value: habilitarTop,
                    onChanged: onTopChanged,
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}
