//Terceros
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Providers
import 'package:provider_bloc/src/providers/animes_info_provider.dart';
import 'package:provider_bloc/src/providers/peliculas_anime_info_provider.dart';

class SuperText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    //Intancia del provider
    
    final animeInfo = Provider.of<AnimesInfo>(context);
    final peliculaInfo = Provider.of<PeliculasAnimesInfo>(context);

    var estiloTextoAnime = TextStyle(fontSize: 30.0, color: animeInfo.colorBase);
    var estiloTextoPelicula = TextStyle(fontSize: 20.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(animeInfo.anime      , style: estiloTextoAnime),
        Text(peliculaInfo.pelicula,style: estiloTextoPelicula),
      ],
    );
  }


}