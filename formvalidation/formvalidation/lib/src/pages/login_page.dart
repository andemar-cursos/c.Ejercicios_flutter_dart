import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  static final String routeName = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
        ],
      )
    );
  }

  //Widget's
  Widget _crearFondo(BuildContext context){
    //tamano de la pantalla
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      //Este es el 40% de la pantalla
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.1),
      ),
    );

    final info = Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0,),
          //El witdh sirve para ocupar todo el ancho y que el container quede centrado
          SizedBox(height: 10.0, width: double.infinity,),
          Text('Andemar', style: TextStyle(color: Colors.white, fontSize: 25.0),),
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(child: circulo, top: 90.0, left: 30.0,),
        Positioned(child: circulo, top: -40.0, right: -30.0,),
        Positioned(child: circulo, bottom: -50.0, right: -10.0,),
        Positioned(child: circulo, bottom: 120.0, right: 20.0,),
        Positioned(child: circulo, bottom: -50.0, left: -20.0,),
        info,
      ],
    );
  }








































}