import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {

  final String? url;
  const ProductImage({
    super.key, 
    this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: _builtBoxDecoration(),
      width: double.infinity,
      height: size.height*0.4,
      
      child: Opacity(
        opacity: 1,//en uno eslo mismo que sin opacidad pero lo dej de referencia
        child: ClipRRect(
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: url==null
          ? Image(image: AssetImage('assets/no-image.png'),
          fit: BoxFit.contain,)
          :FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage(url!),
            fit: BoxFit.contain,
            ),
        ),
      ),
        
      
    );
  }

  BoxDecoration _builtBoxDecoration() =>  BoxDecoration(
    //borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 10, //ancho de la sombra en degrade
        offset: Offset(0, 4) // este da el direccionamiento
      )
    ]
  );
}