import 'package:beats/src/pages/home_page.dart';
import 'package:beats/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductosProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beats',
        initialRoute: HomePage.ROUTE_NAME,
        routes: {
          HomePage.ROUTE_NAME : (BuildContext context)  =>  HomePage(),
        },
      ),
    );
  }
}