import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';


class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});


  @override
  Widget build(BuildContext context) {

    cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: <Widget>[

          Stack(
            children: <Widget>[

              const Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview( fullScreen: true )
              ),

              Positioned(
                top: 30,
                child: FloatingActionButton(
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  child: const Icon(Icons.chevron_left, color: Colors.white, size: 60),
                )
              )
            ],
          ),

          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),

                  _MontoBuyNow(),

                  _ColoresYmas(),

                  _BotonesLikeCartSettings()

                ],
              ),
            )
          )
        ],
      )
   );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          const _BotonSombreado( Icon(Icons.favorite, color: Colors.red, size: 25) ),
          _BotonSombreado( Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25) ),
          _BotonSombreado( Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25) ),

        ],
      )
    );
  }
}

class _BotonSombreado extends StatelessWidget {

  final Icon icon;

  const _BotonSombreado( this.icon );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ] 
      ),
      child: icon,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  const _ColoresYmas();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: <Widget>[
      
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(left: 90, child: _BotonColor(Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(left: 60, child: _BotonColor(Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
                Positioned(left: 30, child: _BotonColor(Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
                _BotonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
              ],
            )
          ),

          BotonNaranja(texto: 'More related items', alto: 30, ancho: 160, color: Color(0xffFFC675),)
      
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100 ),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            const Text('\$180', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1 ),
              from: 8,
              child: const BotonNaranja(texto: 'Buy Now', ancho: 120, alto: 40)
            ),
          ],
        ),
      ),
    );
  }
}