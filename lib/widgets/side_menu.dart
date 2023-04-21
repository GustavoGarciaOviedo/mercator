import 'package:flutter/material.dart';
import 'package:mercator/screens/screens.dart';


//ELEMENTO DE LA BARRA DE OPCIONES DENTRO DEL HOME
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,//para que ocupe el espacio del appbar
        children: [
          _DrawerHeader(),//esta es la imagen peye

          // TODO: ajustar las respectivas pantallas
          ListTile(leading: Icon(Icons.home),title: Text('tu cuenta'),
            onTap: () { 
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);} ),//el llamado a la ruta es diferente porque lo especifique asi en la misma clase, y en el main
          ListTile(leading: Icon(Icons.credit_score),title: Text('medio de pago'),
            onTap: (){ 
              Navigator.pushReplacementNamed(context, 'payment');}, ),
          ListTile(leading: Icon(Icons.person_pin_circle_outlined),title: Text('direccion'),
            onTap: (){
               Navigator.pushReplacementNamed(context, 'address');
            }, ),

          SizedBox(height: 265,),
          ListTile(leading: Icon(Icons.exit_to_app_outlined),title: Text('cerrar sesion'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'home');}, ),

        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(child: Container(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover)
      ),
    );
  }
}