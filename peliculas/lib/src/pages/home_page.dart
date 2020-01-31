//terceros
import 'package:flutter/material.dart';
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
          children: <Widget>[
            _swiperTarjetas(),
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














}