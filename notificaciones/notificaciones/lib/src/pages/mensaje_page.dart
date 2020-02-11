import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {

  static final String ROUTE_NAME = 'MensajePage';

  @override
  Widget build(BuildContext context) {

    final String arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mensaje page'),
      ),
      body: Center(
        child: Text(arg),
      ),
    );
  }
}