//terceros
import 'package:flutter/material.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
//Widget personalizado
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

  //Llamado al widget personalizado
  Widget _swiperTarjetas(){
    return CardSwiper(
      peliculas: [1,2,3,4,5],
    );
  }














}