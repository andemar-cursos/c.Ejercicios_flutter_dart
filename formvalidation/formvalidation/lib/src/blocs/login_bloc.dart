//Terceros
import 'dart:async';
//Validaciones
import 'package:formvalidation/src/blocs/validators.dart';

class LoginBloc with Validaors{

  //El broadcast se usa para la escucha multiple
  final _emailController = StreamController<String>.broadcast();

  //El broadcast se usa para la escucha multiple
  final _passController = StreamController<String>.broadcast();


  //Recuperar datos del Stream
  //El transform valida la informacion que transita por el Stream
  Stream<String> get emailStream  => _emailController.stream.transform(validarEmail);
  Stream<String> get passStream   => _passController.stream.transform(validarPass);
  
  //Insertar valores al Stream
  Function(String) get  changeEmail => _emailController.sink.add;
  Function(String) get  changePass  => _passController.sink.add;


  dispose(){
    _emailController?.close();
    _passController?.close();
  }
}