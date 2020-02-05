//Terceros
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//Widget's
import 'package:preferencias/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool    _colorSecundario = false;
  int     _genero = 1;
  String  _nombre = 'andemar';

  //Se debe inicilizar en initState, debido a que los parametros a qui, deben ser estaticos
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _cargarPref();
    //Aca los parametros pueden ser variables.
    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
            onChanged: (value){
              _colorSecundario = value;
              setState(() {});
            }
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
              onChanged: (valor){},
            ),
          ),
        ],
      ),
    );
  }

  _cargarPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero');
    setState((){});
  }

  _setSelectedRadio(int value) async{
    
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('genero', value);
    _genero = value;
    setState((){});
  }














}