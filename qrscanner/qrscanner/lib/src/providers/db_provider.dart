import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrscanner/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  //Constructor privado
  DBProvider._();

  Future<Database> get database async{

    if(_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async{
    
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version)async{
        await db.execute(
          '''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
          '''
        );
      }
    );
  }

  //Crear registros de base de datos -> Metodo de insercion Manual
  nuevoScanRaw(ScanModel nuevoScan) async{

    final db = await database;

    final res = await db.rawInsert(
      """
      INSERT INTO Scans (id, tipo, valor) 
      VALUES (${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}')
      """
    );

    //Numero de inserciones realizadas
    return res;
  }


  nuevoScan(ScanModel nuevoScan) async{
    //Se llama la isntancia
    final db = await database;
    //Se hace el insert
    final res = await db.insert('Scans', nuevoScan.toJson());
    //Se retorna el numero de filas creadas
    return res;
  }


  //Select - obtener informacion
  Future<ScanModel> getScanId( int id ) async{
    //Se llama la instancia
    final db = await database;
    //Se hace el query, indicando la tabla, el where y los argumentos del where
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    //Retorna el modelo, si se encuentra, si no un null.
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }


  Future<List<ScanModel>> getScanAll() async{
    //Se llama la instancia
    final db = await database;
    //Se hace el query, indicando la tabla, el where y los argumentos del where
    final res = await db.query('Scans');
    //Lista resultante      Si no esta vacia se hace
    List<ScanModel> list =  res.isNotEmpty 
                            //Se itera cada elemento, retornando un model, al final vuelve esto una lista
                            ? res.map( (scan) => ScanModel.fromJson(scan)).toList() 
                            //Si no, retorna una lista vacia
                            : [];
    return list;
  }


  Future<List<ScanModel>> getScansByTipo(String tipo) async{

    final db = await database;

    //final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);
    final res = await db.rawQuery("SELECt * FROM Scans WHERE tipo='$tipo'");

    List<ScanModel> list =  res.isNotEmpty
                            ? res.map( (scan) => ScanModel.fromJson(scan)).toList()
                            : [];
    return list;  
  }

  
  //Actualizar registros
  Future<int> updateScan(ScanModel updateScan) async{
    final db = await database;

    final res = db.update('Scans', updateScan.toJson(), where: 'id = ?', whereArgs: [updateScan.id]);

    return res;
  }

  //Borrar registros
  Future<int> deleteScan(int id) async{
    final db = await database;
    //                     %%%%%OJO CON EL MEME DEL WHERE!!!%%%%%
    final res = db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    //Retorna el numero de eliminaciones
    return res;
  }
  
  
  //Borrar registros
  Future<int> deleteAll(int id) async{
    final db = await database;
    
    final res = db.rawDelete("DELETE FROM Scans");
    //Retorna el numero de eliminaciones
    return res;
  }












}