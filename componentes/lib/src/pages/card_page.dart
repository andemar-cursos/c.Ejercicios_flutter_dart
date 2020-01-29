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
          //Se indica la separacion entre card's
          SizedBox(height: 30.0),
          _cardTipo2(),
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

  
  //Metodo para crear una tarjeta tipo2
  Widget _cardTipo2(){

    return Card(
      child: Column(
        children: <Widget>[
          //Este widget permite agregar un placeholder, mientras carga la imagen
          FadeInImage(
            image: NetworkImage("https://images2.alphacoders.com/689/689248.jpg"),
            placeholder: AssetImage("assets/loading.gif"),
            //Duracion de la animacion entre placeholder-imagen
            fadeInDuration: Duration(milliseconds: 200),
            //Altura de la imagen, respecto al Card
            height: 216,
            //Se indica a la imagen, como debe ocupar el espacio
            fit: BoxFit.cover,
          ),
          //Contenedor para el text y aplicar la propiedad padding a este
          Container(
            padding: EdgeInsets.all(7.0),
            child: Text('F por los bordes redondeados')
          ),
        ],
      ),
    );
  }













}