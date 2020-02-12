//Terceros
import 'package:flutter/material.dart';

//Se crea una clase con la clase ChangeNotifier, que es la que lanzara los listeners
class PeliculasAnimesInfo with ChangeNotifier{

  String _peliculas = 'Ordinal Scale';

  //---Getters y Setters---\\\
  get pelicula{
    return _peliculas;
  }

  //El metodo set, al ser cambiado la variable, se lanza la alerta del cambio
  set pelicula(String pelicula){
    _peliculas = pelicula;
    //Alerta de cambio
    notifyListeners();
  }
}