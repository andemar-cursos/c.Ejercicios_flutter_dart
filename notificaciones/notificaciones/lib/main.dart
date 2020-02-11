import 'package:flutter/material.dart';
import 'package:notificaciones/src/providers/push_notifications_providers.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotificaciones();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}