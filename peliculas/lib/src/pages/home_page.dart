//terceros
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
//Widget personalizado
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class home_page extends StatelessWidget {

  PeliculasProviders peliculasProviders = new PeliculasProviders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        centerTitle: false,
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          //Se crea un espacio entre los  widget's
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  //Llamado al widget personalizado
  Widget _swiperTarjetas(){

    return FutureBuilder(
      //Este es el metodo que retornara los datos.
      future: peliculasProviders.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        //Si hay datos, retorna el CardSwiper con la lista de peliculas
        if(snapshot.hasData){
          //Se llama al widget CardSwiper, pasandole el dataSnapshot al parametro pelicula.
          return CardSwiper(peliculas: snapshot.data);
        }else{
          //Si no tiene, retorna un gif de carga
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            ),
          );
        }
      }
    );
  }


  Widget _footer(context){

    return Container(
      //Se establese el uso total del horizontal
      width: double.infinity,
      child: Column(
        //Esto se hace para que los widget se pinten al lado izquierdo
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Se crea un texto, con el thema de la app.
          Container(
            //Esto es para que el texto, quede a 20px del lado izq.
            padding: EdgeInsets.only(left: 20.0),
            child: Text("populares", style: Theme.of(context).textTheme.subhead,)
          ),
          SizedBox(height: 5.0,),
          FutureBuilder(
            future: peliculasProviders.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              // &&&&&&&&& EL ? AL LADO DE DATA, EXPECIFICA, SI HAY DATA, SE HACE
              // EL FOREACH, SI NO, NO SE HACE EL FOREACH &&&&&&&&&&&&
              //snapshot.data?.forEach((p) => print(p.title));
              if(snapshot.hasData){
                return MovieHorizontal(peliculas: snapshot.data);
              }else{
                return Container(
                  height: 400.0,
                  child: Center(
                    //Esto se hace para que el widget quede en el centro
                    child: Center(child: CircularProgressIndicator())
                  ),
                );
              }
            },
          ),
        ],
      ),
    );

  }











}