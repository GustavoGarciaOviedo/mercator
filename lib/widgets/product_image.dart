import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _builtBoxDecoration(),
      width: double.infinity,
      height: 400,
      
      child: ClipRRect(
        //borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/400x300/green'),
          fit: BoxFit.cover,
          ),
      ),
        
      
    );
  }

  BoxDecoration _builtBoxDecoration() =>  BoxDecoration(
    //borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    color: Colors.red.withOpacity(0.8),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 10, //ancho de la sombra en degrade
        offset: Offset(0, 4) // este da el direccionamiento
      )
    ]
  );
}