//Terceros
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

 //Paginas
import 'package:peliculas/src/pages/home_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'peliculas',
      initialRoute: '/',
      routes: {
        '/'   :   (BuildContext context) => home_page(),
      }

    );
  }
}