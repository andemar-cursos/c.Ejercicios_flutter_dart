//Para hacer el metodo base se usa 'mateapp'
import 'package:diseno1/src/pages/basico_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disenos',
      initialRoute: 'basico',
      routes: {
        'basico'  : (BuildContext context) => BasicoPage(),

      }
    );
  }
}