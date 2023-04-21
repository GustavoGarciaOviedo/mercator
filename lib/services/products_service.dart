

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

  bool isLoading = true;
  bool isSaving = false;
  ProductsService(){
    this.loadProducts();
  }
  //TODO: hacer el fetch de los productos

  Future <List<Product>>loadProducts() async {

    isLoading=true;
    notifyListeners();
    //toda esta es una cadena que me trae los datos en peticion
    final url =  Uri.https(_baseUrl,'products.json');//endpoint y el path respectivamente esto vas despues de base url:'products.json'
    final resp =  await http.get(url);//http porque es el metodo de peticion get que voy a  utilizar
    final Map<String, dynamic> productsMap = json.decode(resp.body);
     print('products service $productsMap');


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


//paara crear o actualizar
  Future saveOrCreateProduct(Product product)async{
    isSaving = true;
    notifyListeners();

    if (product.id==null){
      //es creacion
    }
    else{
      // actualizar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

//para peticion al backend
  Future<String> updateProduct (Product product) async {
    final url =  Uri.https(_baseUrl,'products/${product.id}.json');//endpoint y el path respectivamente
    final resp =  await http.put(url, body: product.toJson());//put para catualizar recordar lo que estoy hacioendo
    final decoderData =  resp.body;

    //print(decoderData);
    //TODO: ACTUALIZAR EL LISAUDO DE PRODUCTOS

    final index = products.indexWhere((element) => element.id==product.id);
    products[index]=product;

    return  product.id!;

  }



}