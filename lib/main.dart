import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mercator/screens/screens.dart';
import 'package:mercator/services/products_service.dart';

void main() => runApp(AppState());//corro entonces el provider, porque estaba era  la aplicacion myapp

final miColor = Colors.pink[500];//TODO: hacer una clase que contenga el diseño

//este es el llamado al provider, con eso queda en el nivel mas alto de la aplicacion
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductsService(),lazy: false,)//my provider of products
      ],
      child: MyApp(),//ojo que retorna la clase principal
      );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      
      initialRoute: 'home' ,
      routes: {
        'login':(_) => LoginScreen(),
        'home': (_)=> HomeScreen(),
        'product':(_) => ProductScreen(),
      },//recordad que necesita el contex
      theme: ThemeData.light().copyWith(//MODIFICO A NIVEL GLOBAL TODOS LOS SCAFFOLD, remember pasar a una clase con los diselnos
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(color: miColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData( backgroundColor: miColor,elevation: 0)
      ),
    );
  }
}