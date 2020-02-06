//Terceros
import 'dart:async';

class LoginBloc{

  //El broadcast se usa para la escucha multiple
  final _emailController = StreamController<String>.broadcast();

  //El broadcast se usa para la escucha multiple
  final _passController = StreamController<String>.broadcast();


  //Recuperar datos del Stream
  Stream<String> get emailStream  => _emailController.stream;
  Stream<String> get passStream   => _passController.stream;
  
  //Insertar valores al Stream
  Function(String) get  changeEmail => _emailController.sink.add;
  Function(String) get  changePass  => _passController.sink.add;


  dispose(){
    _emailController?.close();
    _passController?.close();
  }
}