//Terceros
import 'dart:convert';
import 'package:http/http.dart' as http;
//Preferencias
import 'package:formvalidation/src/preferences/preferencias_usuario.dart';

class UsuarioProvider{

  //Llave de la cuenta de firebase
  final String _fireKey = 'AIzaSyDejmN8t6wzrEb6bF2hs2lY3knsgfH5w4c';

  //Preferencias del usuario
  final _prefs = new PreferenciasUsuario();

  //--------SERVICIOS REST-------\\
  //Peticion al servicio REST
  Future<Map<String, dynamic>> nuevoUsuario(String email, String pass) async{
    //Mapa que contiene los datos enviados al servicio rest, como mapa.
    final authData = {
      'email'     : email,
      'password'  : pass,
      'returnSecureToken' : true,
    };

    //Llamado al servicio rest. Indicando el endpoint y su body.
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_fireKey',
      body: json.encode(authData)
    );

    //Respuesta del servicio rest
    Map<String, dynamic> decodedRes = json.decode(resp.body);

    print(decodedRes);

    //Si contiene la llave idToken, significa que si se creo.
    if(decodedRes.containsKey('idToken')){
      
      //Se guarda el token, en el storage de preferencias del usuario
      _prefs.token = decodedRes['idToken'];

      return {'ok': true, 'token': decodedRes['idToken']};
    //Si no, se busca obtiene el mensaje de error y se retorna.
    }else{
      return {'ok': false, 'mensaje': decodedRes['error']['message']};
    }
  } 

  Future<Map<String, dynamic>> login(String email, String pass) async{

    //Mapa que contiene los datos enviados al servicio rest, como mapa.
    final authData = {
      'email'     : email,
      'password'  : pass,
      'returnSecureToken' : true,
    };

    //Llamado al servicio rest. Indicando el endpoint y su body.
    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_fireKey',
      body: json.encode(authData)
    );

    //Respuesta del servicio rest
    Map<String, dynamic> decodedRes = json.decode(resp.body);

    print(decodedRes);

    //Si contiene la llave idToken, significa que si se creo.
    if(decodedRes.containsKey('idToken')){
      
      //Se guarda el token, en el storage de preferencias del usuario
      _prefs.token = decodedRes['idToken'];

      return {'ok': true, 'token': decodedRes['idToken']};
    //Si no, se busca obtiene el mensaje de error y se retorna.
    }else{
      return {'ok': false, 'mensaje': decodedRes['error']['message']};
    }
  }
  //----FIN SERVICIOS REST-------\\













}