//Terceros
import 'dart:convert';
import 'package:http/http.dart' as http;
//modelos
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProviders{
  //variables
  
  //Informacion para apuntar a los servicios REST
  String _apiKey    = 'f8e50be59e187a808a9918c48fad81a4';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';


  //Metodo que retorna una lista de peliculas (actuales en cines)
  Future<List<Pelicula>> getEnCines() async{

    //De esta manera hace la url de endpoint del servicio
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language
    });

    //El async sirve, para que obtenga los datos y lo guarde en data y no
    //retorne un Future
    final data = await http.get(url);
    //El body trae la informacion que nos interesa
    final decodedData = json.decode(data.body);

    //Convertirmos el json en la lista de peliculas
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    //Retorna el arreglo de peliculas
    return peliculas.peliculas;
  }









}