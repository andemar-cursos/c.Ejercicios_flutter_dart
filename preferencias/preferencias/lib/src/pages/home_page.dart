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
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
      ),
      //Esto permite desplegar un menu lateral
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario'),
          Divider(),
        ],
      ),
    );
  }






}