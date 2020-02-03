import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{

  //Se guarda la seleccion de sugerencias
  //String tituloSeleccion = "";

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

                          //Si el query esta vacio, 
    final listaSugerida = (query.isEmpty) 
                          //se muestran las peliculas recientes, si no
                          ? peliculasRecientes
                          //obtiene una lista, donde si comienza con el query, se obtiene la pelicula y se muestra
                          : peliculas.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    // Son las sugerencias cuando la persona escribe
    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[index]),
          onTap: (){
            /* //Esto es para mostrar un widget al momento de seleccionar un resultado en sugerencia
            tituloSeleccion = listaSugerida[index];
            showResults(context); */
          },
        );
      },
    );
  }
  
  









}