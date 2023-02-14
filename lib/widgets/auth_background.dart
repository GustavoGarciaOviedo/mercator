import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Color? color;
  final Widget child;

  const AuthBackground({super.key, this.color, required this.child });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      height: double.infinity,
      child: Stack(//apilar widgets, como una trasparencia lo veo yo jeee
        children: [
          _PinkBox(),
          _headerIcon(),
          this.child  // aqui el this para acordarme que es una variable que cree
        ]),
    );
  }
}

class _headerIcon extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(//guarda un espacio prudente si hay una camara o sensores en la pantalla
      child: Container(
        width: double.infinity,
        child: Icon(Icons.person_pin, color: Colors.white, size: 100,),
      ),
    );
  }
}


//es la parte superiror del stack
class _PinkBox extends StatelessWidget {
  const _PinkBox({super.key});

  @override
  Widget build(BuildContext context) {

    final size =  MediaQuery.of(context).size;//para utilizar las medidas en unidades de porcentaje
    return Container(
      width: double.infinity,
      height: size.height*0.4,
      decoration: _pinkBoxDecoration(),
      child: Stack(
        children: [
          //creo el widget privado para no incrimentar el codigo

          Positioned(child:_Bubble(), top: 10, left: -30, ),//positioned le da la ubicacion a cada burbuja bubble
          Positioned(child:_Bubble(), top: 90, left: 80, ),
          Positioned(child:_Bubble(), top: -40, right: -30, ),
          Positioned(child:_Bubble(), bottom: 10, left: -30, ),
          Positioned(child:_Bubble(), bottom: 90, right: 30, ),
        

        ]),
    );
  }


//este metodo lo uso para hacer mas claro el codigo,,, aqui se le aplica en gradiente de colores, o los colores como tal
  BoxDecoration _pinkBoxDecoration() => const BoxDecoration(
    gradient:  LinearGradient(
      colors: [
        Color.fromARGB(254, 247, 2, 190),
        Color.fromARGB(255, 235, 43, 245)

    ])
  );
}


//creo las burbujas transparentes, como stacks
class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,//dimenciones de la esfera
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),//queda circular con 100
        color: Color.fromRGBO(255, 255, 255, 0.13)
      ) ,

    );
  }
}