import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    controller.addListener(() {

      // print('valor controller: ${ controller.value }');
      setState(() {
      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon( Icons.refresh ),
        onPressed: () {

          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if ( nuevoPorcentaje >100 ) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          controller.forward( from: 0.0 );

          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress( porcentaje ),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {

  final porcentaje;

  _MiRadialProgress( this.porcentaje );
  
    @override
    void paint(Canvas canvas, Size size) {

      // Circulo completado
      final paintCircle = Paint()
        ..strokeWidth = 4
        ..color       = Colors.grey
        ..style       = PaintingStyle.stroke;
      
      final center = Offset( size.width * 0.5, size.height * 0.5 );
      final radius = min( size.width * 0.5, size.height * 0.5 );

      canvas.drawCircle(center, radius, paintCircle);

      // arco
      final paintArco = Paint()
        ..strokeWidth = 10
        ..color       = Colors.pink
        ..style       = PaintingStyle.stroke;
      
      // Parte que se deberá ir llenando
      final arcAngle = 2 * pi * ( porcentaje / 100 );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        arcAngle, 
        false, 
        paintArco,
      );

    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) => true;
  
}