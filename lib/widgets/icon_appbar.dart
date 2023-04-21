import 'package:flutter/material.dart';
import 'package:mercator/providers/count_product_provider.dart';
import 'package:provider/provider.dart';

class IconAppBar extends StatelessWidget {
  const IconAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final countProduct = Provider.of<CountProductProvider>(context);
    //aque va a escuchar el boton con  el getter
    int _selectedProducts = countProduct.addCount;//contador povisional
    return 
    SizedBox(
      width: 85,
      
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              margin: EdgeInsets.all(3),
              width: 82,
              height: 42,
              color: Color.fromRGBO(11, 12, 13, 0.598),
            ),
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            iconSize: 28,
            onPressed: () {
              // Mostrar notificación
            },
          ),
          if (_selectedProducts > 0)
            Positioned(
              bottom: 18,
              right: 16,
              child: Container(
                padding: EdgeInsets.all(2.0),
                
                child: Text(
                  _selectedProducts.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  
  }
}