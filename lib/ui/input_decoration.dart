import 'package:flutter/material.dart';
 //ESTA CLASE ES PARA UTILIZAR LA DECORACION DEL INPUT Y COMO SON VARIOS NECESITO RECICLARLA
class InputDecorations {
  static InputDecoration authInputDecoration(){
    return InputDecoration(//aqui todo la decoracion del input
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(//crea el borde subrayado
                    color:Colors.grey,
                    
                  )
                 ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                    width: 2
                  )
                ),
                hintText: 'tudirecion@email.com',
                labelText: 'Email' ,
                prefixIcon: Icon(Icons.alternate_email_outlined, color: Colors.pinkAccent, size: 19,)

              );
  }
  
}