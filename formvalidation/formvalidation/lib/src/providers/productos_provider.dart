//terceros
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
//Preferencias
import 'package:formvalidation/src/preferences/preferencias_usuario.dart';
//Modelos
import 'package:formvalidation/src/models/producto_model.dart';

class ProductosProvider{

  //Url base del servicio REST
  final String _url = 'https://flutter-varios-d5e08.firebaseio.com';

  //Preferencias del usario
  final _prefs = new PreferenciasUsuario();

  //Metodo REST para la creacion de un producto en la Db
  Future<bool> crearProducto(ProductoModel producto) async{
    
    //Endpoint para agregar un producto. -> En firebase se necesita el .json al final
    final url = '$_url/productos.json?auth=${_prefs.token}';
    
    //Se realiza la insercion. en el body se envia el string con los datos del producto
    //Ejem: {"id":null,"titulo":"Tamal","valor":8.0,"disponible":true,"fotoUrl":null}
    final resp = await http.post(url, body: productoModelToJson(producto));
    //print(productoModelToJson(producto));

    //Retorna el ID del producto que se anadio a la DB.
    final decodedData = json.decode(resp.body);
    //print('decoded: $decodedData');

    return true;
  }
  
  
  //Metodo REST para la edicion de un producto en la Db
  Future<bool> editarProducto(ProductoModel producto) async{
    
    //Endpoint para agregar un producto. -> En firebase se necesita el .json al final
    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';
    
    //Se realiza la insercion. en el body se envia el string con los datos del producto
    //Ejem: {"id":null,"titulo":"Tamal","valor":8.0,"disponible":true,"fotoUrl":null}
    final resp = await http.put(url, body: productoModelToJson(producto));
    //print(productoModelToJson(producto));

    return true;
  }


  Future<List<ProductoModel>> cargarProducos() async{
    //Url dele endpoint
    final url   = '$_url/productos.json?auth=${_prefs.token}';
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

  //REST para borrar un producto segun su ID
  Future<int> borrarProducto(String id) async{
    //Direccion del servicio REST
    final url = '$_url/productos/$id.json?auth=${_prefs.token}';
    print(url);
    //Se hace la peticion
    final resp = await http.delete(url);
    //Se imprime la respuesta del body
    print(json.decode(resp.body));

    return 1;
  }


  Future<String> subirImagen(File imagen) async{

    //Al subi un archivo se necesita usar el Uri, en vez del url
    final url = Uri.parse('https://api.cloudinary.com/v1_1/depfbgqy4/image/upload?upload_preset=spdad5ll');

    final mimeType = mime(imagen.path).split('/'); //-> image/jpg-png-gif..etc.

    //Direccion donde se hara el request
    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url,
    );
    
    //Archivo a subir
    final file = await http.MultipartFile.fromPath(
      //Se expecifica el tipo que se subira
      'file',
      //Se expecifica el path del archivo
      imagen.path,
      //Se expecifica que tipo y sub tipo es. image/jpg
      contentType: MediaType(mimeType[0], mimeType[1]),
    );

    //Se agrega el archivo al request.
    //Si se quiere adjuntar mar archivos, solo se duplica esta linea, pasando por parametro el otro archivo.
    imageUploadRequest.files.add(file);
    

    //Ejecucion del request
    final streamResponse = await imageUploadRequest.send();

    //Respuesta del request
    final resp = await http.Response.fromStream(streamResponse);

    if(resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo salio mal');
      print(resp.body);
      return null;
    }
    
    final respData = json.decode(resp.body);
    print(respData);

    //Esa posicion, es donde se encuentra la url de la imagen subida.
    return respData['secure_url'];
  }




}