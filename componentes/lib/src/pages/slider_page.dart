import 'dart:ui';

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 0.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders")
      ),
      //Esto se hace para separar el slider de la parte superior
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            //Este expanded se usa para que la imagen ocupe el resto de la pantalla
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }


  Widget _crearSlider(){
    return Slider(
      //Se cambia el color del slider
      activeColor: Colors.redAccent,
      //Se cambia el texto de la burbuja
      label: 'Tamano de la imagen',
      //Ponde puntos divisorios en el slider
      //divisions: 20,
      //se ingresa el valor por defecto
      value: _valorSlider,
      //El valor minimo
      min: 0.0,
      //El valor maximo
      max: 100.0,
      //El data, trae el valor seleccionado por el suario
      // Si _bloq == true, null, si no, que se habilite.
      onChanged: (_bloquearCheck) ? null : (data){
        setState(() => _valorSlider = data);
      },
    );
  }


  Widget _crearCheckBox(){
    
    //De esta manera solo se crea el checkbox 
    /* return Checkbox(
      value: _bloquearCheck,
      onChanged: (data){
        setState(() {
           _bloquearCheck = data;
        });
      },
    ); */

    //De esta otra, se crea con un campo de texto
    return CheckboxListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (data){
        setState(() {
           _bloquearCheck = data;
        });
      },
    );

  }

  //Tiene exatamente los mismos widget de checkbox, solo cambia el nombre (SwitchListTile)
  Widget _crearSwitch(){
   return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (data){
        setState(() {
           _bloquearCheck = data;
        });
      },
    ); 
  }


  Widget _crearImagen(){

    return Image(
      image: NetworkImage("https://i.pinimg.com/236x/25/dc/b1/25dcb126af5e787a823f52aa5126e6cd--sao-anime-sword-art-online.jpg"),
      //El tamano cambia respecto al valor del slider
      width: _valorSlider,
      //Forma de ocupar la pantalla
      fit: BoxFit.contain,
    );
  }







}