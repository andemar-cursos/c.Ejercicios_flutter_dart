import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'HomePage';
  
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Email: ${bloc.email}'),
          Divider(),
          Text('Pass: ${bloc.pass}'),
        ],
      ),
    );
  }
}