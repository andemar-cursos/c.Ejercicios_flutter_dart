import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  //Como es un valor que no cambia y esta dentro de un statelessWidget, debe ser final.
  final TextStyle _estiloTexto = new TextStyle(fontSize: 25);

  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        //Metodo para centrar el contenido de la columna
        mainAxisAlignment: MainAxisAlignment.center,
        //Lista de widget que contendra la columna
        children: <Widget>[
          Text('Numero de click\'s', style: _estiloTexto),
          Text('$_conteo', style: _estiloTexto)
        ],
      )),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, <-- Widget change position button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState((){
            _conteo++;
          });
        },
      ),
    );
  }
}
