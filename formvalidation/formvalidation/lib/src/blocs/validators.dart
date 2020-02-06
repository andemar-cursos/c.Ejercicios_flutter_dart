

import 'dart:async';

class Validaors{
  //                                    input , output
  final validarPass = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink){

      if(pass.length >= 6){
        sink.add(pass);
      }else
        sink.addError('Se deben ingresar mas de 6 caracteres');

    }
  );
  
  
  //                                    input , output
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){

      Pattern patern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp  = new RegExp(patern);

      if(regExp.hasMatch(email)){
        sink.add(email);
      }else
        sink.addError('Digite un email valido');

    }
  );





}