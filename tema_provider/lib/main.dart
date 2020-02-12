//Terceros
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tema_provider/src/blocs/theme_bloc.dart';
//Paginas
import 'package:tema_provider/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //Se crea el widget padre de los providers
    return ChangeNotifierProvider(
      //Se crea la instancia del provider, mandando su dato inicial
      create: (_) => ThemeChanger(ThemeData.dark()),
      //Se sigue con la ejecucion normal de la app.
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final theme  = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme.getTheme(),
      home: HomePage(),
    );
  }














}