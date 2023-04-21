
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  late ThemeData currentTheme; //themeData por que eso e slo que quiero afectar 'los temas' ligth dark.. 
  //lo llamo instancia de este widget esperado,... debo inicarlo o en su defecto late, que indique sera iniciado despues


  ThemeProvider({
    required bool isDarkMode
  }): currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLightMode(){//estos son los metodos que voy a llamar a compar si el uno o el otro
    currentTheme= ThemeData.light();
    notifyListeners();
  }

  setDarkMode(){
    currentTheme= ThemeData.dark();
    notifyListeners();
  }

}