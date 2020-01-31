import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      //El alto sera el 20% de la pantalla
      height: _screenSize.height * 0.2,
      child: PageView(
        //Evita que la pagina tenga efecto de iman
        pageSnapping: false,
        controller: PageController(
          //Con que pagina inicia
          initialPage: 1,
          //Cuantas tarjetas severan al tiempo
          viewportFraction: 0.3,
        ),
        children: _tarjetas(context),
      ),
    );
  }


  List<Widget> _tarjetas(context){
    //Se hace un map, que recorre las peliculas y crea un container en cada una
    return peliculas.map((pelicula) {
      
      return Container(
        //Para que cada tarjeta tenga 15px de espacio en la derecha
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            //Esto se hace para recortar las esquinas
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                //Imagen de la pelicula
                image: NetworkImage(pelicula.getPosterImg()),
                //Placeholder mientras carga
                placeholder: AssetImage('lib/src/assets/img/no-image.jpg'),
                //Ocupar todo el espacio del container
                fit: BoxFit.cover,
                //Esta es la altura del Fade
                height: 150.0,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              //Este es el texto
              pelicula.title,
              //Esto permite colocar 3 puntos (...) cuando es muy largo
              overflow: TextOverflow.ellipsis,
              //Esto le da el estilo de la app
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );

    }).toList();
  }
}