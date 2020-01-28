import 'package:flutter/material.dart';

//Importaciones propias
import 'pages/Home_page.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build( context ){
    return MaterialApp(
      home: Center(
        child: HomePage(),
      )
    );
  }
}