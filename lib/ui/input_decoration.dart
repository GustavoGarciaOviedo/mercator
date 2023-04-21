import 'package:flutter/material.dart';
 //ESTA CLASE ES PARA UTILIZAR LA DECORACION DEL INPUT 
class InputDecorations {
  
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }){
    return  InputDecoration(//aqui todo la decoracion del input
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
                hintText: hintText,//recordar que es un argumento que pase por parametro, de tipo string
                labelText: labelText ,

                //si el parametro prefixicon es difernete de null entonces me pone el que le asigne, si no paso lo deja null ya que no es required
                prefixIcon: prefixIcon!= null 
                ? Icon(prefixIcon, color: Colors.pinkAccent, size: 19,)
                :null

              );
  }
  
}