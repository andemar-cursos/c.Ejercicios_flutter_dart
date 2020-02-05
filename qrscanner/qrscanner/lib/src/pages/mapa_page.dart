//terceros
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
//modelos
import 'package:qrscanner/src/models/scan_model.dart';


class MapaPage extends StatefulWidget {

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();
  List<String> modos = ['streets', 'dark', 'light', 'outdoors', 'satellite'];
  int     modoActual = 0;
  String  tipoMapa = 'streets';

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              map.move(scan.getLatLng(), 13);
            },
          )
        ],
      ),
      body: _crearFlutterMap(context, scan),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearFlutterMap(BuildContext context, ScanModel scan){

    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15,
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(context, scan),
      ],
    );
  }

  LayerOptions _crearMapa(){
    
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken' : 'pk.eyJ1IjoiYW5kZW1hciIsImEiOiJjamhlMWs0YXUwdWMxM2FvMTFoc2xoY2VkIn0.kA78PqrsSBpILUiuQXkojA',
        'id'          : 'mapbox.$tipoMapa'
      } 
    );
  }

  _crearMarcadores(BuildContext context, ScanModel scan){
    
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (context) => Container(
            child: Icon(Icons.location_on, size: 45.0, color: Theme.of(context).primaryColor),
          )
        )
      ]
    );
  }

  Widget _crearBotonFlotante(BuildContext context){

    return FloatingActionButton(
      child: Icon(Icons.repeat),
      onPressed: (){
        modoActual++;
        if(modoActual >= modos.length) modoActual = 0;
        tipoMapa = modos[modoActual];
        setState(() {});
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}