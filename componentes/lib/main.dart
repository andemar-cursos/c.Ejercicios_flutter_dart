//Terceros
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
//Paginas
import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //Esto indica cual es la primera pagina
      initialRoute: '/',
      //Se llama al metodo getApp... que contiene las rutas
      routes: getApplicationRoutes(),
      //Este widget genera una ruta, si la solicitada por el usuario no existe
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage(),
        );
      },
    );
  }










}