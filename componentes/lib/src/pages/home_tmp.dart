import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  final colorAzul = Color.fromARGB(255, 0, 0, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItems(),
      ),
    );
  }


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

  List<Widget> _crearItemsCorto(){
    
  }

}