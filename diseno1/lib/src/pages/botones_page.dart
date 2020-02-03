import 'dart:math';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottonNavigationBar(context),
    );
  }


  //Widget's
  Widget _fondoApp(){
    
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end:  FractionalOffset(0.0, 1.0),
          colors:[
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        
        )
      ),
    );


    final cajaRosada = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ]
          )
        ),
      )
    );
    

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100,
          left: -20,
          child: cajaRosada
        )
      ],
    );
  }


  Widget _titulos(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify transsaction', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0,),
            Text('Classify this transaction into a particular category', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ],
        ),
      ),
    );
  }


  Widget _botonesRedondeados(){
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(),
            _crearBotonRedondeado(),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(),
            _crearBotonRedondeado(),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(),
            _crearBotonRedondeado(),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(),
            _crearBotonRedondeado(),
          ]
        ),
      ],
    );
  }
  Widget _crearBotonRedondeado(){
    return Container(
      height: 180,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.70),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0),
          CircleAvatar(
            backgroundColor: Colors.pink,
            radius: 35.0,
            child: Icon(Icons.ac_unit, color: Colors.white),
          ),
          Text('data', style: TextStyle(color: Colors.pinkAccent)),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }

  //themes
  Widget _bottonNavigationBar(context){

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pink,
        textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))
      ),
      child: BottomNavigationBar(
        items: [
          _bottom(Icon(Icons.calendar_today,  size: 30.0,)),
          _bottom(Icon(Icons.bubble_chart,    size: 30.0,)),
          _bottom(Icon(Icons.supervised_user_circle,size: 30.0,)),
        ]  
      ),

    );
  }
  BottomNavigationBarItem _bottom(Icon icono){
    return BottomNavigationBarItem(
      icon: icono,
      title: Container(),
    );
  }






}