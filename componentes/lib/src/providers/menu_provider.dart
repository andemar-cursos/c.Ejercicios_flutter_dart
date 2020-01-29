//Importacion para obtener archivos
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

//La clase queda privada, solo se mostrara su instancia
class _MenuProvider{

  List<dynamic> opciones = [];

  _MenuProvider(){
    
  }

  //Se crea un metodo con retorno future
  Future<List<dynamic>> cargarData() async{
    //Se crea el llamado al json
    final resp = await rootBundle.loadString('data/menu_opts.json');
    //Se crea un mapa, con el jason
    Map dataMap = json.decode(resp);
    //Se obtiene el arreglo de rutas
    opciones = dataMap['rutas'];
    
    return opciones;
  }

}

//Esto realiza una instancia de la clase
final menuProvider = new _MenuProvider();