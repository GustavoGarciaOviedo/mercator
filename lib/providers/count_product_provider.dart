import 'package:flutter/material.dart';

class CountProductProvider extends ChangeNotifier {

  int _addCount = 0;

  int get addCount{
    return _addCount;
  }

  set addCount(int count){
    _addCount=count;
    notifyListeners();
  }

}