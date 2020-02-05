//Terceros
import 'package:flutter/material.dart';
//Paginas
import 'package:preferencias/src/pages/settings_page.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
      ),
      //Esto permite desplegar un menu lateral
      drawer: _crearMenu(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario'),
          Divider(),
          Text('Genero'),
          Divider(),
          Text('Nombre usuario'),
          Divider(),
        ],
      ),
    );
  }


  //Widget's
  Drawer _crearMenu(BuildContext context){

    return Drawer(
      child: ListView(
        //Esto hace que comience desde el inicio de la pantalla (incluyendo el area de noficicaciones)
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
               image: AssetImage('assets/img/menu.jpg'),
               fit: BoxFit.cover
              )  
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          
          ListTile(
            leading: Icon(Icons.party_mode, color: Theme.of(context).primaryColor),
            title: Text('Party mode'),
            onTap: (){},
          ),
          
          ListTile(
            leading: Icon(Icons.people, color: Theme.of(context).primaryColor),
            title: Text('People'),
            onTap: (){},
          ),
          
          ListTile(
            leading: Icon(Icons.settings, color: Theme.of(context).primaryColor),
            title: Text('Preferencias'),
            onTap: () => Navigator.pushReplacementNamed(context, SettingsPage.routeName),
          ),
          
        ],
      ),
    );
  }







}