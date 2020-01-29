import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Page")),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar alerta"),
          color: Colors.blue,
          //widget para cambiar de color la letra
          textColor: Colors.white,
          //Hace que el boton tenga los border redondeados
          shape: StadiumBorder(),
          //Se envia el contexto
          onPressed:() => _mostrarALerta(context),
        ), 
      ),
      //Boton para retornar a la pagina anterior
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return),
        //widget para navegar al contexto anterior
        onPressed: (){Navigator.pop(context);}, 
      ),
    );
  }


  void _mostrarALerta(context){
    //Metodo para mostrar la alerta
    showDialog(
      context: context,
      //Esto permite o no el cierre de la alerta, al tocar en el exterior
      barrierDismissible: true, 
      builder: (context){

        return AlertDialog(
          title: Text("Alerta"),
          content: Column(
            //Indica que el tamano dependera del contenido
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Este es el contenido de la caja de la alerta"),
              //Logo de flutter
              FlutterLogo(size: 100)
            ],
          ),
          //widget para crear radio en las esquinas de las alertas
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              //widget para cerrar (retornar) a la pagina Alert Page
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Ok"),
              //widget para cerrar (retornar) a la pagina Alert Page
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      }
    );
  }










}