import 'package:flutter/material.dart';
import 'dart:math';

class StarPainter extends CustomPainter {
  final Size size;

  StarPainter(this.size);

  // Método para convertir grados a radianes
  double degToRad(double deg) => deg * (pi / 180.0);

  @override
  void paint(Canvas canvas, Size size) {
    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);

    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();

    final paint = Paint()
      ..color = Colors.blue // Color de la estrella
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200), // Tamaño del widget
      painter: StarPainter(Size(200, 200)),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Dibujo de Estrella')),
      body: Center(child: StarWidget()),
    ),
  ));
}
