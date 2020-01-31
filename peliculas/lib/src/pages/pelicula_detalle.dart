//Terceros
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_model.dart';
//Modelos
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';

class PeliculaDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        //Son los childrens
        slivers: <Widget>[
          _crearAppBar(pelicula),
          //Es como el listView
          SliverList(
            //Los childrens
            delegate: SliverChildListDelegate(
              [
                //Separacion del SliverList y el AppBar
                SizedBox(height: 10.0),
                _posterTitulo(context, pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _descripcion(pelicula),
                _crearCasting(pelicula),
              ]
            ),
          )
        ],
      )
    );
  }


  Widget _crearAppBar(Pelicula pelicula){
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackGroundImg()),
          placeholder: AssetImage('lib/src/assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  Widget _posterTitulo (BuildContext context, Pelicula pelicula){

    return Container(
      //Margen en los horizontales
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
            image: NetworkImage(pelicula.getPosterImg()),
            height: 150.0
            ),
          ),
          //Separacion ntre la imagen y los titulos
          SizedBox(width: 20.0,),
          //Este  es un widget que se ajusta al espacio en pantalla
          Flexible(
            child: Column(
              //Est es para que quede alineado al lado izq
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Se pasa el titulo, el estilo y los 3 puntos, si el titulo es muy largo
                Text(pelicula.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis),
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis),
                //Separacion entre los titulos y la calificacion
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subhead),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget _descripcion (Pelicula pelicula){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),      
      child: Text(
        pelicula.overview,
        //Esto sirve para justificar el texto
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCasting(Pelicula pelicula){

    final peliProvider = new PeliculasProviders();

    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (context, AsyncSnapshot<List> snapshot) {
        
        if(snapshot.hasData){
          return _crearActoresPageView(snapshot.data);
        }else
          return Center(child: CircularProgressIndicator());
      },
    );
  }


  Widget _crearActoresPageView(List<Actor> actores){
    
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: actores.length,
        itemBuilder: (context, i) => _tarjetaActor(actores[i]),
      ),
    );
  }


  Widget _tarjetaActor(Actor actor){
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
              image: NetworkImage(actor.getfoto()),
              placeholder: AssetImage('lib/src/assets/img/no-image.jpg'),
              height: 150.0,
              fit: BoxFit.cover
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }


}