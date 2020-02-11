//Terceros
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

 FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


 initNotificaciones(){

   _firebaseMessaging.requestNotificationPermissions();

   _firebaseMessaging.getToken().then((token){

    print('==== FCM TOKEN ====');
    
    print(token);
    //coWDVnzy7Q4:APA91bEqYa76Yq6vH7ZA8oOCGc_oTDEFbYsWw7xOK5VDQyhgPTKHr8-JF7QZtjTGfmnfdkC-t9f1YO3RlraELC9_bDw664sNvLZ20TpRSoGP00p4vlpEVPkq8BDqcc7lPlu5f8e1JYXu

   });
 }











}