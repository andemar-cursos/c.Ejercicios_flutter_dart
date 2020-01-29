import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('LisTile title'),
          ),
          //widget que creara una linea entre ListTitle
          Divider(),
          ListTile(
            title: Text('LisTile title'),
          ),
          Divider(),
          ListTile(
            title: Text('LisTile title'),
          ),
        ],
      ),
    );
  }
}