//Terceros
import 'package:flutter/material.dart';
//Modelos
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Text("La pelicula es: ${pelicula.title}"),
      )
    );
  }
}