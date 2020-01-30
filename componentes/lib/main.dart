//Terceros
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//Rutas
import 'package:componentes/src/routes/routes.dart';
//Paginas
import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
          const Locale('en'), // English
          const Locale('es'), // Espanol
      ],
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