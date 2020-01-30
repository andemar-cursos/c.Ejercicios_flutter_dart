import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  //Permite controlar el scroll
  ScrollController _scrollController = new ScrollController();

  //Se crea una lista de numeros vacia
  List<int> _listaNumeros = new List();
  //Se indica el index del ultimo elemento
  int _ultimoItem = 0;
  //Bandera para saber si se esta cargando datos
  bool _isLoading    = false;

  //Este metodo se iniciara, al momento de ingresar a la pagina
  @override
  void initState() { 
    super.initState();
    //Se agrega 10 elementos a la lista
    _agregar10();
    //Se crea un listener al scroll del ListView
    _scrollController.addListener((){
     //Si el escroll llega a su ultima posicion....
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fetchData();
      }
    });
  }

  //Este metodo es lanzado, cuando se destruye la pagina
  @override
  void dispose() {
    super.dispose();
    //Esto se hace para borrar la instancia de scrollController
    _scrollController..dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listas"),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }


  Widget _crearLista(){
    return ListView.builder(
      //Se crea una instancia del controlador del ListView
      controller: _scrollController,
      //Se indica el tamano del ListView
      itemCount: _listaNumeros.length,
      itemBuilder: (context, index){
        //Esto obtiene el numero del arreglo
        final imagen = _listaNumeros[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          placeholder: AssetImage("assets/loading.gif"),
        );
      },
    );
  }

  //Metodo que agrega 10 elemento mas a la lista
  void _agregar10(){
    //agrega 10 elemento mas a la lista
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    //Se vuelve a cargar la pagina, como _isLoading es false
    //el metodo _crearLoading, retorna un contenedor vacio
    //"eliminando" la animacion de carga
    setState(() {});
  }


  Future<Null> _fetchData() async{
    _isLoading = true;

    //Al hacer el state, se recarga la pagina, llamando al metodo
    //_crearLoading, el cual lanza la animacion de loading ya que
    //_isLoading pasa a true
    setState(() {});

    final duration = new Duration(seconds: 2);
    //No se agrega los () a respues.. debido a que se quiere indicar una referencia,
    //no a ejecutarse en el momento que se llama
    //Metodo que "simula" la tardanza de una peticion.
    return new Timer(duration, respuestaHTTP);

  }

  //Metodo que simula la respuesta REST de un servicio
  void respuestaHTTP(){
    _isLoading = false;

    //Este widget hace una animacion, al pasar 250milis
    _scrollController.animateTo(
      //Se suma 100px a la posicion actual
      _scrollController.position.pixels + 100,
      //Con animacion tipo fastOutSlowIn
      curve: Curves.fastOutSlowIn,
      //Con duracion de 250mils.
      duration: Duration(milliseconds: 250),
    );

    _agregar10();
  }


  Widget _crearLoading(){
    //Si se esta cargando el contenido, lanza una animacion de loading
    if(_isLoading){
      return Column(
        //Que ocupe todo el contenido de la pantalla
        mainAxisSize: MainAxisSize.max,
        // Se posicion en la parte inferior de la pantalla
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            //Se posiciona en la parte central
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Animacion de loading
              CircularProgressIndicator(),
            ]
          ),
          //Separacion del final de la pantalla con la animacion
          SizedBox(height: 15.5)
        ],
      );
    }else{
      //Si no se esta cargando contenido, retorna un container vacio.
      return Container();
    }
  }
























}