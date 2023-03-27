import 'package:flutter/material.dart';
import 'package:mercator/screens/screens.dart';
import 'package:mercator/services/products_service.dart';
import 'package:mercator/widgets/side_menu.dart';
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
      drawer: SideMenu(),//barra de opciones


      body: SingleChildScrollView(
        child: Column(children: [
        SizedBox(height: 50,),
        MyCardSwiper(),
        ListProduct(),
        
      
        ],),
      ),
          // ListProduct(),
          
         //,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){}
        ),
    );
  }
}
//enlugar del cars swiper puede ir esto
//ListView.builder(
      //   itemCount: productsService.products.length, //TODO: products es lo que retorna de la conversion del map del provider
      //   itemBuilder: (BuildContext context, int index) => GestureDetector(
      //     onTap: () {
      //       //TODO: 228 Cargar imagen del producto en la pantalla de edicion
      //       productsService.selectedProduct = productsService.products[index].copy();
      //       Navigator.pushNamed(context,'product');
      //       },// lo envia a la otra pantalla con posobilidad de retornar
      //     child: ProductCard(
      //       product: productsService.products[index],
      //     ),
      //   ),
      // ),