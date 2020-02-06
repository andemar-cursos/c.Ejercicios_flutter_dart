//Terceros
import 'package:flutter/material.dart';
//Utilidades
import 'package:formvalidation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {

  static final String routeName = 'ProductoPage';

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  //Esta es la llave que 'amarrara' al form.
  final  formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: (){}
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: (){}
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            //Este es el 'fromController' del formulario
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearPrecio(),
                _crearBoton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre(){

    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      //Este metodo valida los datos ingresados por el usuario
      validator: (valor){
        if( valor.length < 3){
          return 'Ingrese el nombre del producto';
        }
          return null;
      },
    );
  }

  Widget _crearPrecio(){
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      //Este metodo valida los datos ingresados por el usuario
      validator: (valor){
        if(utils.isNumeric(valor)){
          return null;
        }else
          return 'Solo numeros';
      },
    );
  }

  Widget _crearBoton(BuildContext context){

    return RaisedButton.icon(
      label: Text('Guardar'),
      textColor: Colors.white,
      icon: Icon(Icons.save, color: Colors.white,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Theme.of(context).primaryColor,
      onPressed: _submit,
    );
  }

  void _submit(){
    //Si el formulario es incorrecto, no realiza el codigo
    if(!formKey.currentState.validate()) return;
    

  }
}