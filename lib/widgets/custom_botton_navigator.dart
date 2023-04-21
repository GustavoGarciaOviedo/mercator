

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_navigation_provider.dart';

class CustomBottonNavigator extends StatelessWidget {
  const CustomBottonNavigator({super.key});

  @override
  Widget build(BuildContext context) {

    final bottomNavigatorProvider = Provider.of<BottomNavigatorProvider>(context);
    final currentIndex = bottomNavigatorProvider.selectedMenuOption;

    return BottomNavigationBar(
      onTap: (int i)=> bottomNavigatorProvider.selectedMenuOption = i ,//el ontap usa el indice del icono
      //  o del item y lo manda al provider para que se cambie y este asu vez informa donde se este usando y 
      // cambia el indice, para este caso cambiaria el case del condicional que esta en el home_screen
      currentIndex: currentIndex,
      elevation: 0,
      type: BottomNavigationBarType.fixed,//evita que se agreguen o quiten ítems durante la ejecución de la aplicación.
      selectedItemColor: Colors.pink[500],
      unselectedItemColor: Colors.black,
     
     
      backgroundColor: Color.fromRGBO(251, 251, 251, 11),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          
        ),
        
        
        BottomNavigationBarItem(
          icon: Icon(Icons.pages_rounded),
          label: 'Categorias' ),
        
        
        BottomNavigationBarItem(
          icon: Icon(Icons.star_outline_rounded),
          label: 'Sugeridos' ),
        
        
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Pedido' ),
      ],
      
      
    );
  }
}