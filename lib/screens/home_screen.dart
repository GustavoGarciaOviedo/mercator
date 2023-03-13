import 'package:flutter/material.dart';
import 'package:mercator/screens/screens.dart';
import 'package:mercator/services/products_service.dart';
import 'package:mercator/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);//este me trae la lista 

    if (productsService.isLoading) {
      return LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('productos'),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length, //TODO: products es lo que retorna de la conversion del map del provider
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context,'product'),// lo envia a la otra pantalla con posobilidad de retornar
          child: ProductCard(
            product: productsService.products[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){}
        ),
    );
  }
}