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
    //Obtener scans de la base de datos
  }

  dispose(){
    //El ? valida de que exista
    _scansController?.close();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream;
}