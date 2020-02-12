//terceros
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Providers
import 'package:provider_bloc/src/pages/home_page.dart';
import 'package:provider_bloc/src/providers/peliculas_anime_info_provider.dart';
//Paginas
import 'package:provider_bloc/src/providers/animes_info_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    //Se usa este widget, para poder usar varios providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create : (context) => AnimesInfo()),
        ChangeNotifierProvider(create : (context) => PeliculasAnimesInfo()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: HomePage.ROUTE_NAME,
        routes: {
          HomePage.ROUTE_NAME  : (BuildContext context)  => HomePage(),
        },
      ),
    );
  }


  
  
  
  //Esto se usa cuando es un solo provider

  /* @override
  Widget build(BuildContext context) {
    //Se debe iniciar con este widget, ya que es el que controlara los 'Streams'
    return ChangeNotifierProvider(
      //Se le pasa el contexto y los providers
      create: (context) => AnimesInfo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: HomePage.ROUTE_NAME,
        routes: {
          HomePage.ROUTE_NAME  : (BuildContext context)  => HomePage(),
        },
      ),
    );
  } */
}