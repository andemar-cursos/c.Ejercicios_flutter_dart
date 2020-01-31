//Terceros
import 'dart:async';
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

  //banderas de carga
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  //Indica la pagina de resultado que traera
  int _popularesPage = 0;


  //STREAM
  //El broadcast sirve para escuchar en varios lugares un solo stream
  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  //Esto permitira enviara datos mediante el stream
  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  //Esto permitira la escucha del stream
  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;



  void disposeStreams(){
    //El ? pregunta si existe, si es asi, lo cierra
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{
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

  //Metodo que retorna una lista de peliculas (actuales en cines)
  Future<List<Pelicula>> getEnCines() async{

    //De esta manera hace la url de endpoint del servicio
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language
    });

    //Retorna la resolucion del metodo
    return await _procesarRespuesta(url);
  }
  
  
  
  //Metodo que retorna una lista de peliculas (actuales en cines)
  Future<List<Pelicula>> getPopulares() async{

    //Bandera -> Esto permitira carga 1 sola vez en cada momento, las popularMovies
    //Si ya se esta cargando una, retorna vacio.
    if(_cargando) return [];
    _cargando = true;

    _popularesPage++;

    //De esta manera hace la url de endpoint del servicio
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : _popularesPage.toString(),
    });

    //Esta variable, obtiene la lista de peliculas
    final resp = await _procesarRespuesta(url);

    //Anado las peliculas a la lista (Si ya hay, las agrega al final)
    _populares.addAll(resp);
    //Se envia la lista completa por el stream
    popularesSink(_populares);

    //bandera -> Al finalizar de cargar, vuele false la bandera, para permitir otra consulta
    _cargando = false;
    //retorna la respuesta obtenida (no la lista completa)
    return resp;
  }









}