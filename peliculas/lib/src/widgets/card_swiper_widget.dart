//Terceros
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<dynamic> peliculas;

  //Con el decorador, se obliga a mandar la lista de peliculas
  CardSwiper({ @required this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screeSize = MediaQuery.of(context).size;

    return Container(
      //double.infinity significa, todo.
      padding: EdgeInsets.only(top: 20),
      child: new Swiper(
      //Este es el ancho del swiper, segun el tamano del dispotivo %70
      itemWidth: _screeSize.width * 0.7,
      //Este es el alto del swiper, segun el tamano del dispotivo %50
      itemHeight: _screeSize.height * 0.5,
        //Es el tipo de Swiper que se realizada
        layout: SwiperLayout.STACK,
        //Inserta una imagen al elemento
        itemBuilder: (BuildContext context,int index){
          //Esto es para recortar las esquinas
          return ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network("https://somoskudasai.com/wp-content/uploads/2019/12/ZThmZqX.jpg",fit: BoxFit.cover,),
          );
        },
        itemCount: peliculas.length,
        //Esto despliega la paginacion inferior
        //pagination: new SwiperPagination(),
        //Esto oculta las felchas laterales
        //control: new SwiperControl(),
      ),
    );
  }
}