

import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/models.dart';//cuando importo product que esta dentro de la carpeta models :)
import 'package:http/http.dart' as http;

//ESTE ES EL PROVIDER
//esta clase la utilizo como provider
//ESTA CLASE HAY QUE INSTANCIARLA DE MANERA GLOBAL (en el main es la primera opcion)o EN SU DEFECTO EN LA PARTE QUE LO REQUIERA ESPECIFICAMENTE
class ProductsService extends ChangeNotifier{
  
  final _baseUrl= 'flutter-productos-bfdd2-default-rtdb.firebaseio.com';
  final List<Product> products = [];//creo la lista de productos que recibe desde lso modelos (quictype.io)

  //creo un anueva propiedad que me va a alojar un producto
  late Product selectedProduct;

  bool isLoading=true;

  ProductsService(){
    this.loadProducts();
  }
  //TODO: hacer el fetch de los productos

  Future <List<Product>>loadProducts() async {

    isLoading=true;
    notifyListeners();
    //toda esta es una cadena que me trae los datos en peticion
    final url =  Uri.https(_baseUrl,'products.json');//endpoint y el path respectivamente
    final resp =  await http.get(url);//http porque es el metodo de peticion get que voy a  utilizar
    final Map<String, dynamic> productsMap = json.decode(resp.body);
     print(productsMap);


//e;l siguiente foreach para que  me convierta en una lista (array) el mapa(clave valor)
     productsMap.forEach((key, value) {
      final temProduct = Product.fromMap(value);//que obtenga del mapa de productos los valores
      temProduct.id= key;
      this.products.add(temProduct);
     });
     isLoading=false;
     notifyListeners();

     return this.products;
     //print(products[0].name);
  }
}