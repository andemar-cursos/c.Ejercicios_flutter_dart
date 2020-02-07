//terceros
import 'dart:convert';
import 'package:http/http.dart' as http;
//Modelos
import 'package:formvalidation/src/models/producto_model.dart';

class ProductosProvider{

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


  Future<List<ProductoModel>> cargarProducos() async{
    //Url dele endpoint
    final url   = '$_url/productos.json';
    //Esta es la respuesta del servidor
    final resp  = await http.get(url);
    //Este mapa obtiene el body de la respuesta
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    //Si se obtuvo nada, retorna una lista vacia
    if(decodedData == null) return [];

    //Se crea la lista de retorno que contiene todos los productos
    final List<ProductoModel> productos = new List();
    //Se crea un temp
    ProductoModel prodTemp = new ProductoModel();

    //Se realiza un forEach por cada objeto
    decodedData.forEach( (id, prod) {
      //Se pasa de String Json al productoModel
      prodTemp = ProductoModel.fromJson(prod);
      //Se agrega el id
      prodTemp.id = id;
      //Se agrega el temp a la lista retorno
      productos.add(prodTemp);
    });

    //Se retorna la lista de la DB.
    return productos;
  }










}