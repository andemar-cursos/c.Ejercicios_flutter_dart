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
  int _ultimoItem         = 0;

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
        //Agrega 10 elementos mas a la lista
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("listas"),
      ),
      body: _crearLista(),
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
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }






























}