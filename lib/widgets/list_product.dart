import 'package:flutter/material.dart';
import 'package:mercator/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';


// TODO: no me cuadra bien los espacion entre imagenes, la imagen no se acomoda al container. esta hardcodeado
class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    //final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 250,
      //color: Colors.red,
      
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsService.products.length, //TODO: products es lo que retorna de la conversion del map del provider
        //itemExtent: 200,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              productsService.selectedProduct = productsService.products[index].copy();
              Navigator.pushNamed(context,'product');
              },// lo envia a la otra pantalla con posobilidad de retornar
            child: ProductCard(
              product: productsService.products[index],
            ),
          ),
        ),
      
    );
  }
}