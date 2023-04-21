import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class IconAdd extends StatelessWidget {
  const IconAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final countProduct = Provider.of<CountProductProvider>(context);//este aguelo obtiene el valor
    //TODO: tambien deberia llamar el provider que me agrege lso elementos a otra paguina cuando el onpress u ontap
    //int count=1;
    return Positioned(
      top: 7,
      right: 15,
      child: GestureDetector(// lo envolvi en gesture detector par darl mas campo de accion al boton
        onTap: () {
          countProduct.addCount = countProduct.addCount + 1;
        },
        child: Icon(
          Icons.add_circle_outline, 
          size: 60, 
          color: Color.fromARGB(255, 45, 225, 66),
        ),
          //       shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(width: 1.0, ),
      ),
  
    ); 
  }
}

