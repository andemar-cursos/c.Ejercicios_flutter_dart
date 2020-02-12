//terceros
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Providers
import 'package:provider_bloc/src/pages/home_page.dart';
//Paginas
import 'package:provider_bloc/src/providers/animes_info_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimesInfo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: HomePage.ROUTE_NAME,
        routes: {
          HomePage.ROUTE_NAME  : (BuildContext context)  => HomePage(),
        },
      ),
    );
  }
}