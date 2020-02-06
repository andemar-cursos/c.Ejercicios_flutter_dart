//Terceros
import 'dart:async';
//Validaciones
import 'package:formvalidation/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validaors{

  //El broadcast se usa para la escucha multiple
  final _emailController = BehaviorSubject<String>();

  //El broadcast se usa para la escucha multiple -> Se cambia el StreamController por BehaviorSubject, que ya tiene el broadcast
  final _passController = BehaviorSubject<String>();


  //Recuperar datos del Stream
  //El transform valida la informacion que transita por el Stream
  Stream<String> get emailStream  => _emailController.stream.transform(validarEmail);
  Stream<String> get passStream   => _passController.stream.transform(validarPass);
  
  //Esta linea retorna true, si los dos stream's retorna resultados. -> (val) es la suma de los dos retornos de los Streams.
  Stream<bool> get formValidStream => CombineLatestStream([emailStream, passStream], (val) => true);

  //Insertar valores al Stream
  Function(String) get  changeEmail => _emailController.sink.add;
  Function(String) get  changePass  => _passController.sink.add;



  //Getters
  String get email => _emailController.value;
  String get pass  => _passController.value;

  dispose(){
    _emailController?.close();
    _passController?.close();
  }
}