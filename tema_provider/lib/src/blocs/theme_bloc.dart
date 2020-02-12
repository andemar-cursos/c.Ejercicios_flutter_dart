//Terceros
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{

  ThemeData _themedata;

  ThemeChanger(this._themedata);

  getTheme() => _themedata;

  setTheme(ThemeData theme){
    this._themedata = theme;
    notifyListeners();
  }






}