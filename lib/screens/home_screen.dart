import 'package:flutter/material.dart';

import 'package:mercator/screens/screens.dart';
import 'package:mercator/services/products_service.dart';
import 'package:mercator/widgets/widgets.dart';

import 'package:provider/provider.dart';

import '../providers/bottom_navigation_provider.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);//este me trae la lista 

    if (productsService.isLoading) {
      return LoadingScreen();
    }
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        title: Text('Productos',style: TextStyle(fontSize: 18),),
      actions: [IconAppBar()],
      ),
      drawer: SideMenu(),//barra de opciones laterales(hamburguesa)

      body: _HomeBody(),
      bottomNavigationBar: CustomBottonNavigator()//menu unferior
      
      //floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){} ),
    );
  }
}



//MANIPULADOR DEL BODY
class _HomeBody extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    // optenerl el BottomNavigatorProvider
     final bottomNavigatorProvider = Provider.of<BottomNavigatorProvider>(context);

     final currentIndex= bottomNavigatorProvider.selectedMenuOption;//solo escucha el estado del index el botom navigatonbar

    switch (currentIndex) {
      case 0:
         return ProductHome();
      case 1:
         return ProductCategory();
      case 2:
         return ProductPromotion();
      case 3:
         return ProductOrder();
      default:
          return ProductHome();
      
    }
  }
}
























// ESTOS SON LOS DATOS DE USARIO SOLO LOS USO PARA PRUBA DEL SAHARE PREFERENCE
// class _DataUser extends StatelessWidget {
//   const _DataUser({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('isDarkMode: ${Preferences.isDarkModeGet}'),
//         Divider(),
//         Text('genero: ${Preferences.genderGet}'),
//         Divider(),
//         Text('nombre de usuario: ${Preferences.nameGet}'),
//         Divider(),
//       ],
//     );
//   }
// }
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