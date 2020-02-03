import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{

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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias cuando la persona escribe
    return Container();
  }
  
  
}