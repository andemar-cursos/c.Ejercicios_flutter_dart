//Terceros
import 'package:flutter/material.dart';
//Model
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
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
  //Se hace la instancia con los metodos REST
  final  productosProvider = Productosprovider();

  ProductoModel producto = new ProductoModel();

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
                _crearDisponible(context),
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
      initialValue: producto.titulo,
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
      //Si el campo es correcto, se le asigna el nombre al producto
      onSaved: (value) => producto.titulo = value,
    );
  }
  Widget _crearPrecio(){
    return TextFormField(
      initialValue: producto.valor.toString(),
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
      //Si el campo es correcto, se le asigna el valor al producto
      onSaved: (value) => producto.valor = double.parse(value),
    );
  }
  Widget _crearDisponible(BuildContext context){

    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Theme.of(context).primaryColor,
      onChanged: (value) => setState((){
        producto.disponible = value;
      }),
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

    //Esta linea hara el save, de los campos del formulario
    formKey.currentState.save();

    print(producto.titulo);
    print(producto.valor);
    print(producto.disponible);

    //Servicio REST para creaer un product en la DB.
    productosProvider.crearProducto(producto);
  }
}