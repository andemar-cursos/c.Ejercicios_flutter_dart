import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';

class DataSearch extends SearchDelegate{

  //Se guarda la seleccion de sugerencias
  //String tituloSeleccion = "";

  final peliculasProviders = new PeliculasProviders();

  final peliculas = [
    'spiderman',
    'aquaman',
    'batman',
    'shazam!',
    'ironman',
    'capitan america'
  ];

  final peliculasRecientes = [
    'spriderman',
    'capitan america'
  ];  

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro appBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          //El query es la variable del label del search.
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izq del appBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        //Esto cierra el search y retorna un valor, si es necesario
        close(context, null);
      },

    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //  Crea los resultados a mostrar
    return Center(
      /*//Esto es un widget que se muestra al oprimir una sugerencia
        child: Container(
        height: 100.0,
        width:  100.0,
        color: Colors.blueAccent,
        child: Text(tituloSeleccion),
      ), */
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(query.isEmpty){
      return Container();
    }

    return FutureBuilder(
      future: peliculasProviders.busquedaPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData){

          final peliculas = snapshot.data;

          return ListView(
            children: peliculas.map( (pelicula){
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage("lib/src/assets/img/no-image.jpg"),
                  width: 50.0,
                  fit: BoxFit.contain
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: (){
                  close(context, null);
                  pelicula.uniqueId = "${pelicula.id}-search";
                  Navigator.pushNamed(context, "detalle", arguments: pelicula);  
                },
              );
            }).toList(),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
  









}