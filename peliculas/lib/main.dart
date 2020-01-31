//Terceros
import 'package:flutter/material.dart';
 //Paginas
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'peliculas',
      initialRoute: '/',
      routes: {
        '/'       :   (BuildContext context) => home_page(),
        'detalle' :   (BuildContext contect) => PeliculaDetalle(),
      }
    );
  }
}