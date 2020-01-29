import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Page")),
      //Boton para retornar a la pagina anterior
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return),
        //widget para navegar al contexto anterior
        onPressed: (){Navigator.pop(context);}, 
      ),
    );
  }
}