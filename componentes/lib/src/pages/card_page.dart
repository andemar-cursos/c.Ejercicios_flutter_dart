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
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  //Metodo que crea un tipo de tarjeta
  Widget _cardTipo1(){
    
    return Card(
      //Se "eleva" la tarjeta y la proyeccion de la sombra se agranda
      elevation: 10.0,
      //Indica la intencidad del radio, en las esquinas de la tarjeta
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
    
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          //Este widget permite agregar un placeholder, mientras carga la imagen
          FadeInImage(
            image: NetworkImage("https://images2.alphacoders.com/689/689248.jpg"),
            placeholder: AssetImage("assets/loading.gif"),
            //Duracion de la animacion entre placeholder-imagen
            fadeInDuration: Duration(milliseconds: 200),
            //Altura de la imagen, respecto al Card
            height: 300,
            //Se indica a la imagen, como debe ocupar el espacio
            fit: BoxFit.fitHeight,
          ),
          //Contenedor para el text y aplicar la propiedad padding a este
          Container(
            padding: EdgeInsets.all(7.0),
            child: Text('F por los bordes redondeados')
          ),
        ],
      ),
    );

    //Al crear la tarjeta (en este caso un container) se emplea otro container
    //para darle estilo (sombra, radio, color, etc..) al container con la info.
    return Container(
      //Se crea un widget con las decoraciones que contendra el container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        //Sombra (elevation) del container
        boxShadow: <BoxShadow>[
          BoxShadow(
            //Se expecifica su color y opacidad (numero)
            color: Colors.black26,
            //Difuminado de la sombra
            blurRadius: 10.0,
            //alcance de la sombra
            spreadRadius: 2.0,
            //Posicion de la sombra (x, y)
            offset: Offset(2.0, 10.0)
          )
        ]
        //color: Colors.red,
      ),
      //Este widget nos permite cortar lo que este exterior al contenedor
      child: ClipRRect(
        //Se indic el radio el cual cortara el contenedor
        borderRadius: BorderRadius.circular(30.0),
        //El cotenedor
        child: card,
      ),
    );
  }













}