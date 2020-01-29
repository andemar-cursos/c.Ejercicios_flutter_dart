//Terceros
import 'package:flutter/material.dart';
//Propias
import 'package:componentes/src/providers/menu_provider.dart';
//Utilidades
import 'package:componentes/src/utils/icono_string_util.dart';
//Paginas

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  
  
  
  //Se crea una clase que contendra una lista
  Widget _lista() {
    //Se crea un FutureBuilder debido a que se llenara mediante json
    return FutureBuilder(
      //Se llama al json, mediante el widget future
      future: menuProvider.cargarData(),
      //Se llena con una data inicial, en este caso, una lista vacia.
      initialData: [],
      //Se cre el builder con el contexto y con los datos de future (snapshot)
      //Se infiere que el contex es de tipo BuildContext
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        //Se retorna un ListView
        return ListView(
          //Se crea la lista con los datos del snapshot y el context
          children: _listaItems(snapshot.data, context),
        );

      },
    );
  }

  //Se cre un metodo con la lista de datos
  List<Widget> _listaItems(List<dynamic> data, context) {
    //variable que contendra los datos
    final List<Widget> opciones = [];

    data.forEach((opt){
      
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt["ruta"]);
        },
      );
      
      opciones..add(widgetTemp)
              ..add(Divider(color: Colors.blue));
    });

    return opciones;
  }
















}