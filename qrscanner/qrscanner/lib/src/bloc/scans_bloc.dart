//Terceros
import 'dart:async';
import 'package:qrscanner/src/providers/db_provider.dart';


class ScansBlock{
  
  static final ScansBlock _singleton = new ScansBlock._internal();

  //En caso de no existir, se crea una entidad
  factory ScansBlock(){
    return _singleton;
  }

  ScansBlock._internal(){
    obtenerScans();
    //Obtener scans de la base de datos
  }

  dispose(){
    //El ? valida de que exista
    _scansController?.close();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream;

  agregarScan(ScanModel scanModel) async{
    await DBProvider.db.nuevoScan(scanModel);
    //Al momento de eliminar, se actualiza la lista
    obtenerScans();
  }


  obtenerScans() async{
    _scansController.sink.add(
      await DBProvider.db.getScanAll()
    );
  }


  borrarScan(int idScan) async{
    await DBProvider.db.deleteScan(idScan);
    //Al momento de eliminar, se actualiza la lista
    obtenerScans();
  }


  borrarScansAll() async{
    //Al momento de eliminar, se actualiza la lista
    await DBProvider.db.deleteAll();
    obtenerScans();
  }


















}