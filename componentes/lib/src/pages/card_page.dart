import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardPage"),
      ),
      body: ListView(
        //Esto crea una separacion entre todos los margenes
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
        ],
      ),
    );
  }

  //Metodo que crea un tipo de tarjeta
  Widget _cardTipo1(){
    
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Soy el titulo de esta tarjeta"),
            subtitle: Text("tiene que ser una descripcion gigante para poder tener un salto de linea y ver como es que se ve esta baina en un telefono celular, sera suficiente con este larguero que acabo de escribir o no ?"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){},
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  













}