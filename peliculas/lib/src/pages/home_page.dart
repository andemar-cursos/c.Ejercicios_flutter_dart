//terceros
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class home_page extends StatelessWidget {
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


  Widget _swiperTarjetas(){

    return Container(
      //double.infinity significa, todo.
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 20),
      child: new Swiper(
        //Es el tipo de Swiper que se realizada
        layout: SwiperLayout.STACK,
        //Indica el ancho del Swiper
        itemWidth: 200.0,
        //Inserta una imagen al elemento
        itemBuilder: (BuildContext context,int index){
          return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: 3,
        //Esto despliega la paginacion inferior
        //pagination: new SwiperPagination(),
        //Esto oculta las felchas laterales
        //control: new SwiperControl(),
      ),
    ) ;
  }














}