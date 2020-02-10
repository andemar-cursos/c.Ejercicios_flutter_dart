import 'package:flutter/material.dart';

//Metodo para verificar si un string, tiene valores numericos (Contando los double)
bool isNumeric(String valor){
  //Si es valor es empty retorna false
  if(valor.isEmpty) return false;
  //Se trata de pasar a number
  final res = num.tryParse(valor);
  //Si el valor es null, retorna false, si no, true.
  return (res == null) ? false : true;
}

//Muestra un mensaje de alerta
void mostrarAlerta(BuildContext context, String mensaje){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text('Informacion incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=>Navigator.of(context).pop(),
            child: Text('Ok')
          )
        ],
      );
    }
  );
}