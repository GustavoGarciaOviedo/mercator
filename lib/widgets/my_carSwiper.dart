import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:mercator/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class MyCardSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    return Container(
      width: double.infinity,
      height: 300,
      child: Swiper(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              productsService.selectedProduct = productsService.products[index].copy();
              Navigator.pushNamed(context,'product');
            },
            child: ProductCard(
              product: productsService.products[index],
            ),
          );
        },
    
        //TODO: la imagen cuando se presiona el boton o se pasa automaticamente se pasan de ados fotografias o es el efectopor que segin el indice no pasa nada
        layout: SwiperLayout.STACK,
        //axisDirection: AxisDirection.up,
        itemWidth: 200,
        itemHeight: 300.0,
        autoplay: false, // si esta en true se pasan las imagenes solas
        autoplayDisableOnInteraction: true,//en true se detiene la animacion mientras interactuo manualmente
        duration: 1000,//duracion de la animacion
        onIndexChanged: (index) {
         print('este es $index');
        },
        // pagination: SwiperPagination(),// muestra un punto señalando la cantidad de tarjetas que hay
        //control: SwiperControl(color: Colors.black),// son las flechas para mover las imagenes
        
      ),
    );
  }
  
}

