//Terceros
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qrscanner/src/models/scan_model.dart';
//Paginas
import 'package:qrscanner/src/pages/direcciones_page.dart';
import 'package:qrscanner/src/pages/mapa_page.dart';
//Bloc
import 'package:qrscanner/src/bloc/scans_bloc.dart';

class HomePage extends StatefulWidget {

  //Build
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBlock();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRScanner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: _borrarTodos,
          )
        ],
      ),
      body: _callPage(_currentIndex),
      bottomNavigationBar: _crearBottonNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _crearFlotante(),
    );
  }


  //Widget's
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
      onPressed: _scanQR,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
  _scanQR() async{
    
    //guiausc.000webhostapp.com
    //geo:3.4517276203872265,-76.5467120691193
    
    String futureString = 'guiausc.000webhostapp.com';

    /* try {
      futureString = await BarcodeScanner.scan();
    } catch (e) {
      futureString = e.toString();
    }
    */

    if(futureString != null){
      
      final scan = ScanModel(valor: futureString);
      
      scansBloc.agregarScan(scan);
    } 
  }


  //Metodos
  void _borrarTodos(){
    scansBloc.borrarScansAll();
  }















}