import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:animate_text/animate_text.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:shoppy3/config/imports.dart';
import 'package:shoppy3/widget/button.dart';
import 'package:shoppy3/widget/countdown.dart';
import 'package:shoppy3/widget/espacio.dart';


class GanadorPage extends StatefulWidget {
  final String ganador;
  final List<String> suplentes;
  final List<String> top;
  final bool habilitarTop;

  const GanadorPage({
    Key? key,
    required this.ganador,
    required this.suplentes,
    required this.top,
    required this.habilitarTop,
  }) : super(key: key);

  @override
  _GanadorPageState createState() => _GanadorPageState();
}

class _GanadorPageState extends State<GanadorPage> {
  bool mostrarTop = true;
  bool mostrarSuplentes = false;
  bool mostrarCuentaAtras = false;
  bool mostrarGanadores = false;
  int currentTopIndex = 0;
  late Timer _topTimer;

  final CountDownController _countDownController = CountDownController();

  @override
  void initState() {
    super.initState();

    if (widget.habilitarTop) {
      _topTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (currentTopIndex < widget.top.length - 1) {
          setState(() {
            currentTopIndex++;
          });
        } else {
          _topTimer.cancel();
        }
      });
    }

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        mostrarSuplentes = true;
      });
    });
  }

  @override
  void dispose() {
    _topTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[900],

      body: Center(

        child: mostrarTop && widget.habilitarTop
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Top 3 Participantes",
                style: const TextStyle(color: Colors.white, fontSize: 23),
              ),

              Espacio(ESPACIO_MEDIANO),

              for (int i = 0; i <= currentTopIndex; i++)
                  Column(
                    children: [
                      AnimateText(
                        widget.top[i],
                        style: TextStyle(
                            color: Colors.deepPurpleAccent[100], fontSize: 30),
                        type: AnimateTextType.bottomToTop,
                      ),

                    Espacio(ESPACIO_PEQUENO),
                    ],
                  ),

                Espacio(ESPACIO_GRANDE),

                if (currentTopIndex == widget.top.length - 1)
                  ButtonCustom(
                    height: 37,
                    width: 100,
                    colorHover: COLOR_ACCENT_HOVER,
                    colorPressed: COLOR_ACCENT_PRESSED,
                    colorText: Colors.white,
                    texto: "Continuar",
                    onPressed: () {

                      setState(() {
                        mostrarTop = false;
                        mostrarCuentaAtras = true;
                      });
                      _countDownController.start();

                    },
                  ),
              ],
            )

            : mostrarCuentaAtras
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "Cuenta Atrás:",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                Espacio(ESPACIO_MEDIANO),

                CountdownWidget(
                  duration: 10,
                  controller: _countDownController,
                  ringColor: Colors.grey[300]!,
                  fillColor: Colors.purpleAccent[100]!,
                  backgroundColor: Colors.purple[500]!,
                  strokeWidth: 20.0,
                  textStyle: TextStyle(
                      fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
                  isReverse: true,
                  isReverseAnimation: true,
                  onComplete: () {
                    setState(() {
                      mostrarCuentaAtras = false;
                      mostrarGanadores = true;
                    });
                  },
                )

              ],
            )

            : mostrarGanadores
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ha Ganado:",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                  textAlign: TextAlign.center,
                ),

                Espacio(ESPACIO_MEDIANO),

                AnimateText(
                  widget.ganador,
                  style: TextStyle(
                      color: COLOR_ACCENT_SECONDARY,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                  withScale: true,
                  type: AnimateTextType.bottomToTop,
                ),

                Espacio(ESPACIO_GRANDE),

                if (mostrarSuplentes && widget.suplentes.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        "Suplentes:",
                        style: TextStyle(color: Colors.white, fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                      Espacio(ESPACIO_PEQUENO),
                      FadeIn(
                        delay: Duration(seconds: 2),
                        duration: Duration(seconds: 5),
                        child: Container(
                          height: 210,
                          child: SingleChildScrollView(
                            child: Column(
                              children: widget.suplentes
                                  .map((suplente) => Text(
                                suplente,
                                style: TextStyle(
                                    color: Colors
                                        .deepPurpleAccent[100],
                                    fontSize: 24),
                                textAlign: TextAlign.center,
                              ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
              ),

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
          )
        : Container(),
      ),
    );
  }

}
