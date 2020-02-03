import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final styleTitulo     = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final styleSubTitulo  = TextStyle(fontSize: 18.0, color: Colors.grey);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image(
            image: NetworkImage("https://images4.alphacoders.com/800/800256.png"),
          ),
          Container(
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
          )
        ],
      )
    );
  }
}