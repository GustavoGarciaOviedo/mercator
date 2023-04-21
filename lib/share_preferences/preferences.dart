
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

//TODO: esta clase es la primordial para facilitar el share prefrences
// lo que quiero que me quede guardado en la memoria del telefeno
class Preferences {
      static late SharedPreferences _prefs ;


    //los ago privados por que solo qiero acceder desde esta clase
      static String _name = '';
      static bool _isDarkMode = false;
      static int _gender = 1;

    // para poder iniciar esas preferencias _prefs
      static Future init() async{
        _prefs = await SharedPreferences.getInstance();
      }

      //getter y setter
      
      //entonces.. tipo de dato, string , metodo get, nombre,, y protocolo shareprefrences para obtencion
      static String get nameGet{
        return _prefs.getString('name') ??  _name;
        }

        static set nameSet(String value) {
          _name = value;
          _prefs.setString('name', value);
        }
        


        static bool get isDarkModeGet {
          return _prefs.getBool('isDarkMode') ??  _isDarkMode;
        }

        static set isDarkModeSet(bool value) {
          _isDarkMode = value;
          _prefs.setBool('isDarkMode', value);
        }



        static int get genderGet {
          return _prefs.getInt('gender') ??  _gender;
        }

        static set genderSet(int value) {
          _gender = value;
          _prefs.setInt('gender', value);
        }

}