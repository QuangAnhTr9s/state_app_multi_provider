import 'package:flutter/material.dart';

class MyCounter extends ChangeNotifier{
  int _myCounter = 0;

  int get myCounter => _myCounter;
  void add(){
    _myCounter++;
    notifyListeners();
  }
}