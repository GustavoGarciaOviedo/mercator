import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mercator/widgets/widgets.dart';
import 'package:mercator/providers/providers.dart';
import 'package:mercator/share_preferences/preferences.dart';
import 'package:mercator/screens/screens.dart';
import 'package:mercator/services/products_service.dart';



void main() async {

  //TODO: ver si en este  provider puedo incluir las shareprefrences
  //lo hago aqui para poder utilizarlo en cualquier lugar llamese widget

  WidgetsFlutterBinding.ensureInitialized();//para que inicialice si es necesario
  await Preferences.init();
  runApp(AppState());
  }//corro entonces el provider, porque estaba era  la aplicacion myapp

final miColor = Colors.pink[500];//TODO: hacer una clase que contenga el diseño

//este es el llamado al provider, con eso queda en el nivel mas alto de la aplicacion
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductsService(),lazy: false,),//my provider of products
        ChangeNotifierProvider(create: (_)=> ThemeProvider(isDarkMode: Preferences.isDarkModeGet)),
        ChangeNotifierProvider(create: (_)=> BottomNavigatorProvider()),
        ChangeNotifierProvider(create: (_)=> CountProductProvider()),
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
      //TODO: optimizar la forma de las rutas tal como settingScreen
      routes: {
        'login'           : (_) => LoginScreen(),
        'home'            : (_) => HomeScreen(),
        'product'         : (_) => ProductScreen(),
        SettingsScreen.routeName:(context) => SettingsScreen(),// lo manipulo de esta forma, ver .dar
        'order'           : (_) => ProductOrder(),
        'payment'         : (_) => PaymentMethod(),
        'address'         : (_) => UserAddress(),
        'productCategory' : (_) => ProductCategory(),
        'productPromotion': (_) => ProductPromotion(),

      },//recordad que necesita el contex
      theme: //Provider.of<ThemeProvider>(context).currentTheme,//TODO:El tema esta condicionado al switch de settings
      
       ThemeData.light().copyWith(//MODIFICO A NIVEL GLOBAL TODOS LOS SCAFFOLD, remember pasar a una clase con los diselnos
          //fontFamily: 'Montserrat',
          textTheme:    GlobalThemeFontFamily(),
          
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: AppBarTheme(color: miColor),
          floatingActionButtonTheme: FloatingActionButtonThemeData( backgroundColor: miColor,elevation: 0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: miColor,)
        ),
    );
  }
}
