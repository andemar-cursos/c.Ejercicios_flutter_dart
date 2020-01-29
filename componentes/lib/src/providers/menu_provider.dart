//Importacion para obtener archivos
import 'package:flutter/services.dart' show rootBundle;

//La clase queda privada, solo se mostrara su instancia
class _MenuProvider{

  List<dynamic> opciones = [];

  _MenuProvider(){
    _cargarData();
  }

  _cargarData() {
    //Future, para cargar archivos
    rootBundle.loadString('data/menu_opts.json')
    .then((data) {
      print(data);
    });
  }

}

//Esto realiza una instancia de la clase
final menuProvider = new _MenuProvider();