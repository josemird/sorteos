import 'dart:math';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/screens/Ganador.dart';


void mostrarGanador(BuildContext context, List<String> participantes, int suplentes) {
  if (participantes.isEmpty) return;

  /// Obtener participaciones
  final contador = <String, int>{};

  for (var participante in participantes) {
    if (participante.trim().isNotEmpty) {
      contador[participante] = (contador[participante] ?? 0) + 1;
    }
  }

  /// Seleccionar ganador (número participaciones)
  final listaConPesos = <String>[];
  contador.forEach((nombre, veces) {
    listaConPesos.addAll(List.generate(veces, (index) => nombre)); // Añadir 'veces' veces el nombre
  });

  final randomIndexGanador = Random().nextInt(listaConPesos.length);
  final ganador = listaConPesos[randomIndexGanador];

  /// Eliminar  ganador de la lista de suplentes
  final listaRestante = List.from(participantes);
  listaRestante.removeWhere((participante) => participante == ganador);

  /// Seleccionar suplentes aleatoriamente sin repetir, excluyendo al ganador
  List<String> suplentesGenerados = [];
  Set<String> suplentesSeleccionados = {};

  while (suplentesGenerados.length < suplentes && listaRestante.isNotEmpty) {
    final suplenteIndex = Random().nextInt(listaRestante.length);
    final suplente = listaRestante[suplenteIndex];

    /// Añadir suplentes no seleccionados previamente
    if (!suplentesSeleccionados.contains(suplente)) {
      suplentesGenerados.add(suplente);
      suplentesSeleccionados.add(suplente);
      listaRestante.removeAt(suplenteIndex); // Eliminarlo para que no se repita
    }
  }

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => GanadorPage(
        ganador: ganador,
        suplentes: suplentesGenerados,
      ),
    ),
  );
}