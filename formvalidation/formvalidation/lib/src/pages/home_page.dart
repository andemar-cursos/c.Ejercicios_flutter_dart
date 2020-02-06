import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';

import 'producto_page.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'HomePage';
  
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(),
      floatingActionButton: _crearBoton(context   ),
    );
  }


  //Widget's
  Widget _crearBoton(BuildContext context){

    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor:  Theme.of(context).primaryColor,
      onPressed: ()=> Navigator.pushNamed(context, ProductoPage.routeName)
    );
  }
























}