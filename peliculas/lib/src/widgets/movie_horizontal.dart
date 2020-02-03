import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  //Funciones
  final Function siguientePagina;

  //Variables
  final List<Pelicula> peliculas;

  //Controller's
  final _pageController = new PageController(
    //Con que pagina inicia
    initialPage: 1,
    //Cuantas tarjetas severan al tiempo
    viewportFraction: 0.3,
  );

  //Constructor
  //Obtiene las peliculas actuales, y la funcion la cual agrega las siguientes paginas
  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){
      //Si la posicion del scroll es mayor o igual, al maximo - 200pixeles
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });

    return Container(
      //El alto sera el 20% de la pantalla
      height: _screenSize.height * 0.2,
      //Con el pageView.builder, se renderiza las tarjetas, cuando son necesarias.
      child: PageView.builder(
        //Evita que la pagina tenga efecto de iman
        pageSnapping: false,
        controller: _pageController,
        //Se le pasa el tamano a renderizar
        itemCount: peliculas.length,
        //Y se pasa un widget encargado de la obtencion de cada tarjeta individual.
        itemBuilder: (context, i) => _tarjeta(context, peliculas[i]),
      ),
    );
  }

  Widget _tarjeta(context, Pelicula pelicula){
    
    final tarjeta = Container(
      //Para que cada tarjeta tenga 15px de espacio en la derecha
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          //Esto se hace para recortar las esquinas
          Hero(
            tag: pelicula.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                //Imagfen de la pelicula
                image: NetworkImage(pelicula.getPosterImg()),
                //Placeholder mientras carga
                placeholder: AssetImage('lib/src/assets/img/no-image.jpg'),
                //Ocupar todo el espacio del container
                fit: BoxFit.cover,
                //Esta es la altura del Fade
                height: 150.0,
              ),
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

    return GestureDetector(
      child: tarjeta,
      onTap: (){
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}