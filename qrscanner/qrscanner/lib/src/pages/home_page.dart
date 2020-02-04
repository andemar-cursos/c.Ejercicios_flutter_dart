import 'package:flutter/material.dart';
import 'package:qrscanner/src/pages/direcciones_page.dart';
import 'package:qrscanner/src/pages/mapa_page.dart';

class HomePage extends StatefulWidget {

  //Build
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRScanner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){},
          )
        ],
      ),
      body: _callPage(_currentIndex),
      bottomNavigationBar: _crearBottonNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _crearFlotante(),
    );
  }

  Widget _crearBottonNavigatorBar(){

    return BottomNavigationBar(
      //Que elemento esta activo
      currentIndex: _currentIndex,
      //Recibe el index, el cual se oprimio
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text("mapas")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text("direcciones")
        ),
      ],
    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return MapasPage();
      case 1: return DireccionesPage();
      default:return MapasPage();
    }
  }


  Widget _crearFlotante(){
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      onPressed: (){},
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}