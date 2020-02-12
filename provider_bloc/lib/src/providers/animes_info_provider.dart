//Terceros
import 'package:flutter/material.dart';

//Se crea una clase con la clase ChangeNotifier, que es la que lanzara los listeners
class AnimesInfo with ChangeNotifier{

  String _animes = 'clannad';

  //---Getters y Setters---\\\
  get anime{
    return _animes;
  }

  //El metodo set, al ser cambiado la variable, se lanza la alerta del cambio
  set anime(String anime){
    _animes = anime;
    //Alerta de cambio
    notifyListeners();
  }
}