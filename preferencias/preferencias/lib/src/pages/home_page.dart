//Terceros
import 'package:flutter/material.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
//Paginas
//import 'package:preferencias/src/pages/settings_page.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();
    prefs.ultimaPagina = HomePage.routeName;


    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
        backgroundColor: prefs.colorSecundario ? Colors.deepOrange : Colors.grey,
      ),
      //Esto permite desplegar un menu lateral
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario: ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }






}