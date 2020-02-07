//terceros
import 'dart:convert';
import 'package:http/http.dart' as http;
//Modelos
import 'package:formvalidation/src/models/producto_model.dart';

class Productosprovider{

  //Url base del servicio REST
  final String _url = 'https://flutter-varios-d5e08.firebaseio.com';

  //Metodo REST para la creacion de un producto en la Db
  Future<bool> crearProducto(ProductoModel producto) async{
    
    //Endpoint para agregar un producto. -> En firebase se necesita el .json al final
    final url = '$_url/productos.json';
    
    //Se realiza la insercion. en el body se envia el string con los datos del producto
    //Ejem: {"id":null,"titulo":"Tamal","valor":8.0,"disponible":true,"fotoUrl":null}
    final resp = await http.post(url, body: productoModelToJson(producto));
    //print(productoModelToJson(producto));

    //Retorna el ID del producto que se anadio a la DB.
    final decodedData = json.decode(resp.body);
    //print('decoded: $decodedData');

    return true;
  }













}