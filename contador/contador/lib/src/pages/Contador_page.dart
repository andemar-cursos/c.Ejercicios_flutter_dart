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
          Text('Numero de tap\'s', style: _estiloTexto),
          Text('$_conteo', style: _estiloTexto)
        ],
      )),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, <-- Widget change position button
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //Widget que hace la separacion en una lista
        SizedBox(width: 30),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _reset),
        //El expanded, hace que se separe lo maximo posible
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _sustraer),
        //Separaacion de 10px
        SizedBox(width: 10),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar),
      ],
    );
  }

  void _agregar(){
    setState(() => _conteo++);
  }

  void _sustraer(){
    setState(() => _conteo--);
  }

  void _reset(){
    setState(() => _conteo = 0);
  }

}
