//terceros
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
//Widget personalizado
import 'package:flutter_swiper/flutter_swiper.dart';

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
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text("populares", style: Theme.of(context).textTheme.subhead,),

          FutureBuilder(
            future: peliculasProviders.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              
              // &&&&&&&&& EL ? AL LADO DE DATA, EXPECIFICA, SI HAY DATA, SE HACE
              // EL FOREACH, SI NO, NO SE HACE EL FOREACH &&&&&&&&&&&&
              snapshot.data?.forEach((p) => print(p.title));

              return Container();
            },
          ),
        ],
      ),
    );

  }











}