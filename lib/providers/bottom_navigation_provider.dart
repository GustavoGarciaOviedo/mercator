import 'package:flutter/material.dart';

class BottomNavigatorProvider extends ChangeNotifier{

  int _selectedMenuOption = 0;

//getter
  int get selectedMenuOption{
    return _selectedMenuOption;
  }

//setter
  set selectedMenuOption(int i){
    _selectedMenuOption = i;
    notifyListeners();
  }

}