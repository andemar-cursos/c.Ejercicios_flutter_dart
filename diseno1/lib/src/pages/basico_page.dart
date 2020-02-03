import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final styleTitulo     = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final styleSubTitulo  = TextStyle(fontSize: 18.0, color: Colors.grey);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _crearImagen(),
          _crearTitulo(),
          _crearAcciones(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
        ],
      )
    );
  }


  Widget _crearImagen(){
    return Image(
            image: NetworkImage("https://images4.alphacoders.com/800/800256.png"),
    );
  }

  Widget _crearTitulo(){
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Sword art online", style: styleTitulo,),
                      SizedBox(height: 7.0),
                      Text("Ordinal Scale", style: styleSubTitulo,),
                    ],
                  ),
                ),
                Icon(Icons.star, color: Colors.red,  size: 30.0),
                Text("41", style: TextStyle(fontSize: 20.0),),
              ],
            ),
          );
  }

  Widget _crearAcciones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, "CALL"),
        _accion(Icons.near_me, "ROUTE"),
        _accion(Icons.share, "SHARE"),
      ],
    );
  }
  Widget _accion(IconData icon, String texto){
    return Column(
          children: <Widget>[
            Icon(icon, color: Colors.blue, size: 40.0),
            SizedBox(height: 5.0,),
            Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue)),
          ],
        );
  }

  Widget _crearTexto(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'Sword Art Online La Película: Ordinal Scale (劇場版 ソードアート・オンライン -オーディナル・スケール- Gekijō-ban Sōdo Āto Onrain -Ōdinaru Sukēru?) es una película de anime japonesa, de aventura y fantasía, basada en la serie de novelas ligeras escritas por Reki Kawahara e ilustradas por abec. La película es producida por A-1 Pictures y dirigida por Tomohiko Itō, esta presenta una historia original por Kawahara, diseño de personajes por Shingo Adachi y música por Yuki Kajiura. Fue estrenada en Japón el 18 de febrero de 2017, en México el 4 de marzo de 2017, y en Estados Unidos el 9 de marzo de 2017.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
