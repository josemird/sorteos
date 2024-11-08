import 'dart:math';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/screens/Ganador.dart';


///GANADORES Y SUPLENTES
void mostrarGanador(BuildContext context, List<String> participantes, int suplentes, bool habilitarTop) {
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
    listaConPesos.addAll(List.generate(veces, (index) => nombre));
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
      listaRestante.removeAt(suplenteIndex);
    }
  }

  // Calcular top 3
  final top = contador.keys.toList()
    ..sort((a, b) => contador[b]!.compareTo(contador[a]!));
  final top3 = top.take(3).toList();

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => GanadorPage(
        ganador: ganador,
        suplentes: suplentesGenerados,
        top: top3,
        habilitarTop: habilitarTop,
      ),
    ),
  );
}