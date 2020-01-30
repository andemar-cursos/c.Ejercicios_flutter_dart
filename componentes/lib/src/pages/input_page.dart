import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
        ],
      )
    );
  }

  Widget _crearInput() {
    return TextField(
      //.....autofocus
      //autofocus: true,
      //widget para hacer la capitalizacion por sentencias.
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        //Texto en la parte inferior derecha del input
        counter: Text("Letras ${_nombre.length}"),
        //texto sugerido al interior del input
        hintText: 'Texto de sugerencia',
        //Texto encima del input
        labelText: 'Nombre',
        //Es un texto de ayuda, debajo del input
        helperText: 'Es un texto de ayuda',
        //Icono al interior del input -> Lado derecho
        suffixIcon: Icon(Icons.accessibility),
        //Icono al exterior del input -> lado izq
        icon: Icon(Icons.account_circle),
      ),
      //Este widget obtiene el valor ingresado por el usuario
      onChanged: (data){
        //Redibuja el widget, por cada letra que se escriba en el inputs
        setState(() {
          _nombre = data;
        });
        //print(_nombre);
      },
    );
  }



  Widget _crearPersona(){

    return ListTile(
      title: Text('Nombre es : $_nombre'),      
    );
  }





}