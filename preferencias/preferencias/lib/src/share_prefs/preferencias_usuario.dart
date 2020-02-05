import 'package:preferencias/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  //Singleton
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  //Al hacer instancia de esta clase, se llama primero al factory
  factory PreferenciasUsuario(){
    //Este retorna la unica instancia que se crea.
    return _instancia;
  }

  //Constructor privado
  PreferenciasUsuario._internal();

  //Creacion de la variable de tipo Shared...
  SharedPreferences _prefs;

  //Metodo para obtener la instancia del SharedPreferences
  initPrefs() async{
  //Instancia de la variable _prefs
  this._prefs = await SharedPreferences.getInstance();
  }


  //Getters y Setters Genero

  get genero{
    //Si no se a guardado nada con genero, entonces retorna 1.
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }
  
  //Getters y Setters colorSecundario

  get colorSecundario{
    //Si no se a guardado nada con genero, entonces retorna 1.
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }
  
  
  //Getters y Setters nombre

  get nombre{
    //Si no se a guardado nada con genero, entonces retorna 1.
    return _prefs.getString('nombre') ?? 'Default';
  }

  set nombre(String value){
    _prefs.setString('nombre', value);
  }
  
  
  //Getters y Setters nombre

  get ultimaPagina{
    //Si no se a guardado nada con genero, entonces retorna 1.
    return _prefs.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
  }













}