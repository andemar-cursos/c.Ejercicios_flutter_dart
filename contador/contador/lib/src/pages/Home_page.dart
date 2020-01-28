import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  //Como es un valor que no cambia y esta dentro de un statelessWidget, debe ser final.
  final TextStyle estiloTexto = new TextStyle(fontSize: 25);
  
  final int conteo = 10;

  //   ^^^^^ SNIPPETS= build ^^^^^^
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titutlo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          //Metodo para centrar el contenido de la columna
          mainAxisAlignment: MainAxisAlignment.center,
          //Lista de widget que contendra la columna
          children: <Widget>[
            Text('Numero de click\'s', style: estiloTexto),
            Text('$conteo', style: estiloTexto)
          ],
        )
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, <-- Widget change position button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('hola mundo');
        },
      ),
    );
  }
}