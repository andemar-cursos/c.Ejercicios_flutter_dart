import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  
  //   ^^^^^ SNIPPETS= build ^^^^^^
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titutlo'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('hola mundo')),
    );
  }
}