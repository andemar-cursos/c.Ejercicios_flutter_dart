//Terceros
import 'package:flutter/material.dart';
//blocs
import 'package:formvalidation/src/blocs/provider.dart';
//Pages
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';
import 'src/pages/home_page.dart';
import 'src/pages/producto_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form Validation',
        initialRoute: HomePage.routeName,
        routes: {
          LoginPage.routeName : (BuildContext context) => LoginPage(),
          HomePage.routeName  : (BuildContext context) => HomePage(),
          ProductoPage.routeName : (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      )
    );
  }
}