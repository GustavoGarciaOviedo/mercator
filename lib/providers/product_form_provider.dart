import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductFormProvider extends ChangeNotifier{
  GlobalKey<FormState> formKey = new  GlobalKey<FormState>();//utilzo para los formularios que van a cambiar

  Product product;

  ProductFormProvider (this.product);

  updateAvailability(bool value){//cambia la disponibilidad del producto
    print(value);
    
    this.product.available = value;
    notifyListeners();
  }

  bool  isValidForm(){
    print(product.name);
    print(product.price);
    print(product.discount);
    return formKey.currentState?.validate() ?? false;
  }
}



/*La clase tiene un método llamado isValidForm() que se utiliza para validar el formulario. El método utiliza
 el método validate() de la clave del formulario para validar el formulario. Si el formulario es válido, 
 el método devuelve true, de lo contrario, devuelve false. El método también utiliza el operador de null-safe (?.)
  para comprobar si la clave del formulario existe antes de llamar al método validate(). Esto evita errores si 
  la clave del formulario no está definida.

En resumen, esta clase proporciona una forma de acceder y validar el formulario de un producto en la aplicación 
Flutter. Además, como es un objeto observable, se puede utilizar en otros lugares de la aplicación para notificar
 a los widgets cuando se produzcan cambios en los datos del formulario o del producto.



 */