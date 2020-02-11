import 'package:flutter/material.dart';
import 'package:notificaciones/src/pages/home_page.dart';
import 'package:notificaciones/src/pages/mensaje_page.dart';
import 'package:notificaciones/src/providers/push_notifications_providers.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //Variable que guardara la instancia del Navigator
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotificaciones();

    pushProvider.mensajes.listen((data){
      //Se usa el navigatorKey, ya que en este momento de la ejecucion, la lista no existe.
      //Asi que se llama a su instancia mediante su key.
      navigatorKey.currentState.pushNamed(MensajePage.ROUTE_NAME, arguments: data);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Notificaciones',
      initialRoute: HomePage.ROUTE_NAME,
      routes: {
        HomePage.ROUTE_NAME     : (BuildContext context)  =>  HomePage(),
        MensajePage.ROUTE_NAME  : (BuildContext context)  => MensajePage(),
      },
    );
  }
}