import 'package:beats/src/pages/home_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beats',
      initialRoute: HomePage.ROUTE_NAME,
      routes: {
        HomePage.ROUTE_NAME : (BuildContext context)  =>  HomePage(),
      },
    );
  }
}