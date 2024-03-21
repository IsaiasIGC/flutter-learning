import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';


class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});


  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.refresh ),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, color: Colors.red)
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje * 1.4, color: Colors.pink),
              CustomRadialProgress(porcentaje: porcentaje * 1.6, color: Colors.purple),
            ],
          ),

        ],
        // child: CircularProgress( 90 ),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;

  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme.textTheme.bodyLarge?.color ?? Colors.blueGrey,
        grosorPrimario: 15,
        grosorSecundario: 10,
      ),
    // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0),),
    );
  }
}