import 'package:flutter/material.dart';
import 'package:qrscanner/src/bloc/scans_bloc.dart';
import 'package:qrscanner/src/providers/db_provider.dart';

class MapasPage extends StatelessWidget {

  final scanBloc = new ScansBlock();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: scanBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        //Retorna un loading, mientras obtiene datos
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        //Al obtener los datos, se guardan en scans
        final scans = snapshot.data;
        //Se verifica que tenga algun elemento
        if(scans.length == 0) return Center(child: Text("No hay informacion"));
        //Se retorna un ListView con los elementos obtenidos
        return _crearListaElementos(scans);
      },
    );
  }


  Widget _crearListaElementos(List<ScanModel> scans){
    return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => Dismissible(
            //key aleatoria, para saber que item se selecciono
            key: UniqueKey(),
            //Esto cambia el color del item cuando se mueve
            background: Container(color: Colors.red),
            onDismissed: (direccion) => scanBloc.borrarScan(scans[i].id),
            child: ListTile(
              leading: Icon(Icons.cloud_queue,  color: Theme.of(context).primaryColor),
              title: Text(scans[i].valor),
              subtitle: Text("ID: ${scans[i].id.toString()}"),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            ),
          ),
        );
  }













}