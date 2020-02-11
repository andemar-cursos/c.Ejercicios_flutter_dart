//Terceros
import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

 initNotificaciones(){

   _firebaseMessaging.requestNotificationPermissions();

   _firebaseMessaging.getToken().then((token){

    print('==== FCM TOKEN ====');
    
    print(token);
    //coWDVnzy7Q4:APA91bEqYa76Yq6vH7ZA8oOCGc_oTDEFbYsWw7xOK5VDQyhgPTKHr8-JF7QZtjTGfmnfdkC-t9f1YO3RlraELC9_bDw664sNvLZ20TpRSoGP00p4vlpEVPkq8BDqcc7lPlu5f8e1JYXu

   });

   _firebaseMessaging.configure(
     
      onMessage: (info){
        print('==== OnMesage ====');
        print(info);

        String data = 'no-data';

        if(Platform.isAndroid){
          //Si hay datos en info, se guardan, si no. sigue data igual.
          data = info['data']['comida'] ?? data;
        }

        _mensajesStreamController.sink.add(data);
      },

      onLaunch: (info){
        print('==== OnLaunch ====');

        print(info);
      },
    
      onResume: (info){
        print('==== OnMesage ====');
        print(info);

        String data = 'no-data';

        if(Platform.isAndroid){
          //Si hay datos en info, se guardan, si no. sigue data igual.
          data = info['data']['comida'] ?? data;
        }

        _mensajesStreamController.sink.add(data);
      },

     

   );


 }


  dispose(){
    _mensajesStreamController?.close();
  }
 











}