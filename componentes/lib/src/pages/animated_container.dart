import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  //VARIABLES  
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);


  //BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        //Se usa el widget AnimatedContainer, para realizar las animaciones
        child: AnimatedContainer(
          //Esto indica la duracion de la animacion del container
          duration: Duration(seconds: 1),
          //Esta es la animacion que realizara -> https://api.flutter.dev/flutter/animation/Curves-class.html
          curve: Curves.elasticIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.fiber_smart_record),
        onPressed: () => _cambiarForma(),
      ),
    );
  }

  void _cambiarForma() {
    //Se crea una instancia de Random
    var rng = new Random();
    setState(() {
      //Se hace un rando de 0 a 300 en estos valores
      _width = rng.nextInt(300).toDouble();
      _height = rng.nextInt(300).toDouble();
      //Se hace un rando de 0 a 254 en estos valores
      _color = Color.fromRGBO(
        rng.nextInt(254),
        rng.nextInt(254),
        rng.nextInt(254),
        1);
        //Se hace un rando de 0 a 100 en estos valores
      _borderRadius = BorderRadius.circular(rng.nextInt(100).toDouble());
    });
  }











}