//Terceros
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Bloc
import 'package:tema_provider/src/blocs/theme_bloc.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Provider
    final theme = Provider.of<ThemeChanger>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: ListBotones(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //Tema personalizado
        onPressed: () => theme.setTheme(ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlueAccent,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
        )),
      ),
    );
  }
}



class ListBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Provider
    final theme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('Light'),
          onPressed: () => theme.setTheme(ThemeData.light()),
        ),
        SizedBox(height: 30.0),
        FlatButton(
          child: Text('Dark'),
          onPressed: () => theme.setTheme(ThemeData.dark()),
        ),

      ],
    );
  }















}