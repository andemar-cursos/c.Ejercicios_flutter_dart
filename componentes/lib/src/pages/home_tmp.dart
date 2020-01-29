import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  //----------- VARIABLES --------------\\
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  final colorAzul = Color.fromARGB(255, 0, 0, 255);

  //----------- BUILD --------------\\
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children: _crearItems(),
        children: _crearItemsCorto(),
      ),
    );
  }

  //----------- METODOS --------------\\

  //Metodo que rellena la lista
  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {      
      final tempWidget = ListTile(
        title: Text(opt),
      );
        lista..add(tempWidget)
             ..add(Divider(height: 3.0, color: colorAzul));
    }

    return lista;
  }

  //Metodo que rellena la lista de manera corta
  List<Widget> _crearItemsCorto(){
    
    return opciones.map((opc){
      
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('$opc!'),
            subtitle: Text('Cualquier cosa'),
            //Icono de la parte izquier del objeto de la lista
            leading: Icon(Icons.screen_lock_landscape),
            //Icono de la parte derecha del objeto de la lista
            trailing: Icon(Icons.keyboard_arrow_right),
            //Funcion al precionar un objeto de la lista
            onTap: () {},
          ),
          Divider(height: 3.0,color: colorAzul),
        ],
      );
    }).toList();

  }


}