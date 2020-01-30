import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _pass  = '';
  String _fecha = '';

  String _opcionSeleccionada = 'Volar';
  List<String> _superPoderes = ['Volar', 'Rayos X', 'Super aliento', 'Super fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      )
    );
  }

  Widget _crearInput() {
    return TextField(
      //.....autofocus
      //autofocus: true,
      //widget para hacer la capitalizacion por sentencias.
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        //Texto en la parte inferior derecha del input
        counter: Text("Letras ${_nombre.length}"),
        //texto sugerido al interior del input
        hintText: 'Texto de sugerencia',
        //Texto encima del input
        labelText: 'Nombre',
        //Es un texto de ayuda, debajo del input
        helperText: 'Es un texto de ayuda',
        //Icono al interior del input -> Lado derecho
        suffixIcon: Icon(Icons.accessibility),
        //Icono al exterior del input -> lado izq
        icon: Icon(Icons.account_circle),
      ),
      //Este widget obtiene el valor ingresado por el usuario
      onChanged: (data){
        //Redibuja el widget, por cada letra que se escriba en el inputs
        setState(() {
          _nombre = data;
        });
        //print(_nombre);
      },
    );
  }


  Widget _crearEmail(){
    return TextField(
      //Esto hace que el teclado del dispositivo, sea de tipo email.
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        //texto sugerido al interior del input
        hintText: 'Email',
        //Texto encima del input
        labelText: 'Email',
        //Icono al interior del input -> Lado derecho
        suffixIcon: Icon(Icons.alternate_email),
        //Icono al exterior del input -> lado izq
        icon: Icon(Icons.email),
      ),
      //Este widget obtiene el valor ingresado por el usuario
      onChanged: (data){
        //Redibuja el widget, por cada letra que se escriba en el inputs
        setState(() =>  _email = data);
      },
    );
  }
  

  Widget _crearPassword(){
    return TextField(
      //Esto hace que la info se vea con puntos negros
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        //texto sugerido al interior del input
        hintText: 'Password',
        //Texto encima del input
        labelText: 'Password',
        //Icono al interior del input -> Lado derecho
        suffixIcon: Icon(Icons.lock),
        //Icono al exterior del input -> lado izq
        icon: Icon(Icons.lock),
      ),
      //Este widget obtiene el valor ingresado por el usuario
      onChanged: (data){
        //Redibuja el widget, por cada letra que se escriba en el inputs
        setState(() =>  _pass = data);
      },
    );
  }


  Widget _crearFecha(context){
    return TextField(
      //Esto evita que el usuario pueda seleccionar el texto y
      //eliminarlo, cambiarlo o pegarlo en el field.
      enableInteractiveSelection: true,
      //Esto guarda la instancia del TextField en una variable
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        //texto sugerido al interior del input
        hintText: 'Fecha de nacimiento',
        //Texto encima del input
        labelText: 'Fecha de nacimiento',
        //Icono al interior del input -> Lado derecho
        suffixIcon: Icon(Icons.calendar_today),
        //Icono al exterior del input -> lado izq
        icon: Icon(Icons.perm_contact_calendar),
      ),
      onTap: (){
        //Esto hace que no se pueda hace focus (seleccionar) el input
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  //Se debe de crear un future, para esperar la respuesta del usuario
  _selectDate(context) async{
    // widget que despliega el widget calendario
    DateTime pick = await showDatePicker(
      context: context,
      //Se selecciona el idioma. -> Este debe configurarse en el pubspec.yaml y main.
      locale: Locale('es'),
      //Fecha que se mostrara por defecto
      initialDate: new DateTime.now(),
      //Fecha minima
      firstDate: new DateTime(2020),
      //Fecha maxima
      lastDate: new DateTime(2030),
    );

    if(pick != null){
      setState(() {
        //Retorna la fecha seleccionada en String
        _fecha = pick.toString();
        //Se cambia el text del fieldData con _fecha del usuario.
        _inputFieldDateController.text = _fecha;
      });
    }
  }


  //ComboBox
  Widget _crearDropDown(){
    return Row(
      children: <Widget>[
        //Se le anade el icono
        Icon(Icons.select_all),
        //La separacion entre el icono y el comboBox
        SizedBox(width: 30.0),
        //Se hace que el comboBox ocupe todo el ancho
        Expanded(
            child: DropdownButton(
            //Aparece un valor por defecto
            value: _opcionSeleccionada,
            //Es la lista de datos a mostrar
            items: _getOpcionesDropDown(),
            
            onChanged: (data){
              _opcionSeleccionada = data;
            },
          ),
        )
      ],
    );
  }

  
  List<DropdownMenuItem<String>> _getOpcionesDropDown(){
    
    List<DropdownMenuItem<String>> lista = new List();
    //Se recorre la lista
    _superPoderes.forEach((poder){
      //Se agrega cada poder a la nueva lista
      lista.add(DropdownMenuItem(
        //Muestra el texto
        child: Text(poder),
        //Muestra el texto, pero en texto
        value: poder,
      ));
    });

    return lista;
  }



  Widget _crearPersona(){

    return ListTile(
      title: Text('Nombre es : $_nombre'), 
      subtitle: Text('Email es: $_email'),
      trailing: Text('SuperPoder es: $_opcionSeleccionada'),
    );
  }


}