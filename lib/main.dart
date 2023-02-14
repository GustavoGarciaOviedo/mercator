import 'package:flutter/material.dart';
import 'package:mercator/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      
      initialRoute: 'login' ,
      routes: {
        'home': (_)=> HomeScreen(),
        'login':(_) => LoginScreen(),
      },//recordad que necesita el contex
      theme: ThemeData.light().copyWith(//MODIFICO A NIVEL GLOBAL TODOS LOS SCAFFOLD
        scaffoldBackgroundColor: Colors.grey[200]
      ),
    );
  }
}