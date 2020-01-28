import 'package:flutter/material.dart';

//Importaciones propias
//import 'pages/Home_page.dart';
import 'pages/Contador_page.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build( context ){
    return MaterialApp(
      //Quita la leyenda de debug
      debugShowCheckedModeBanner: false,
      home: Center(
        child: ContadorPage(),
      )
    );
  }
}