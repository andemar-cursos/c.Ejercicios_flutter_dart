//Terceros
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Provider
import 'package:provider_bloc/src/providers/animes_info_provider.dart';
import 'package:provider_bloc/src/providers/peliculas_anime_info_provider.dart';

class SuperFloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Intancia del provider
    final animeInfo     = Provider.of<AnimesInfo>(context);
    final peliculaInfo  = Provider.of<PeliculasAnimesInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.accessible_forward),
          backgroundColor: Colors.blue,
          //Al lanzar la funcion, se cambia la variable del provider, llamando posterior a la alerta
          onPressed: () {
            animeInfo.anime = 'Sword art online';
            peliculaInfo.pelicula = 'Ordinal Scale';
          },
        ),

        SizedBox(height: 10.0),

        FloatingActionButton(
          child: Icon(Icons.directions_run),
          backgroundColor: Colors.redAccent,
          //Al lanzar la funcion, se cambia la variable del provider, llamando posterior a la alerta
          onPressed: () {
            animeInfo.anime = 'Clannad';
            peliculaInfo.pelicula = 'Kimi no nawa';
          },
        ),

      ],
    );
  }
}