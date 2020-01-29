import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[

          Container(
            //Margenes al circleAvatar
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://i.pinimg.com/236x/25/dc/b1/25dcb126af5e787a823f52aa5126e6cd--sao-anime-sword-art-online.jpg"),
              //Radio del avatar
              radius: 25.0,
            ),
          ),
          Container(
            //Esto es para insertar un margen derecho
            margin: EdgeInsets.only(right: 15),
            //Este widget crea un avatar circular
            child: CircleAvatar(
              //Se expecifica el contenido, en este caso letras
              child: Text("SL"),
              //y el color de fondo
              backgroundColor: Colors.tealAccent,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("http://wallpapersqq.net/wp-content/uploads/2015/10/Sinon-sword-art-online-2-wallpaper.jpg"),
          placeholder: AssetImage("assets/loading.gif"),
          fadeInDuration: Duration(milliseconds: 100),
        ),
      )
    );
  }














}