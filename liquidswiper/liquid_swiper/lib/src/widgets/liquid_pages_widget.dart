import 'package:flutter/material.dart';

final _estiloTexto = TextStyle(fontSize: 20.0, color: Colors.white);

//Lista de containers a mostrar en el LiquidSwipe
final liquidPages = [
  
  Container(
    color: Colors.pinkAccent,
    child: Center(
      child: Text('Slide 1', style: _estiloTexto),
    ),
  ),
  
  Container(
    color: Colors.deepOrange,
    child: Center(
      child: Text('Slide 2', style: _estiloTexto),
    ),
  ),

  Container(
    color: Colors.deepPurple,
    child: Center(
      child: Text('Slide 3', style: _estiloTexto),
    ),
  ),

  Container(
    color: Colors.blueGrey,
    child: Center(
      child: Text('Slide 4', style: _estiloTexto),
    ),
  ),

  Container(
    color: Colors.redAccent,
    child: Center(
      child: Text('Slide 5', style: _estiloTexto),
    ),
  ),

];