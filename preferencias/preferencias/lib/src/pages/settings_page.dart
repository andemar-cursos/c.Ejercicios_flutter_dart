//Terceros
import 'package:flutter/material.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
//Widget's
import 'package:preferencias/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool    _colorSecundario;
  int     _genero;
  String  _nombre = 'andemar';
  
  final prefs = new PreferenciasUsuario();

  //Se debe inicilizar en initState, debido a que los parametros a qui, deben ser estaticos
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    //Se inicializa con los valores de preferencia
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    //Aca los parametros pueden ser variables.
    _textController = new TextEditingController(text: prefs.nombre);

    prefs.ultimaPagina = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: _colorSecundario ? Colors.deepOrange : Colors.grey,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),

          Divider(),
          
          SwitchListTile(
            value: _colorSecundario, 
            title: Text('Color secundario'),
            onChanged: _setSelectedSwitch,
          ),

          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
          ),
          
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),

          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona',
              ),
              onChanged: _setSelectContainer,
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedRadio(int value){
    
    prefs.genero = value;
    _genero = value;
    setState((){});
  }


  _setSelectedSwitch(bool value){
    prefs.colorSecundario = value;
    _colorSecundario = value;
    setState(() {});
  }


  _setSelectContainer(String value){
    prefs.nombre = value;
    _nombre = value;
    setState(() {});
  }









}