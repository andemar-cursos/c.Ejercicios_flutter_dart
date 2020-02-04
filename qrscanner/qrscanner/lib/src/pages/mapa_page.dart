//terceros
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
//modelos
import 'package:qrscanner/src/models/scan_model.dart';


class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ],
      ),
      body: _crearFlutterMap(scan),
    );
  }


  //Widget
  Widget _crearFlutterMap(ScanModel scan){

    return FlutterMap(
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15,
      ),
      layers: [
        _crearMapa(),
      ],
    );
  }


  LayerOptions _crearMapa(){
    
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken' : 'pk.eyJ1IjoiYW5kZW1hciIsImEiOiJjamhlMWs0YXUwdWMxM2FvMTFoc2xoY2VkIn0.kA78PqrsSBpILUiuQXkojA',
        'id'          : 'mapbox.streets'
      } 
    );
  }




}