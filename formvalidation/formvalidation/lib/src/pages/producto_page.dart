//Terceros
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  //Esta es la llave que 'amarra' al scaffold
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //Se hace la instancia con los metodos REST
  final  productosProvider = ProductosProvider();
  //Intancia file para la foto a subir/actualizar
  File foto;

  //Bandera para el guardado/editado de productos
  bool _guardando = false;

  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {

    //Se obtienen los argumentos, si se enviaron.
    final ProductoModel prodArg = ModalRoute.of(context).settings.arguments;
    //Si llega un argumento del navigator, se inserta en el producto.
    if(prodArg != null){
      producto = prodArg;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto
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
                _mostrarFoto(),
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
  //----WIDGET'S DEL BUILD----//
  Widget _mostrarFoto(){
    if(producto.fotoUrl != null){
      return Container();
    }else{
      return Image(
        //Si la imagen tiene data, se guarda la imagen, si no, se pode 'no-image'
        image: AssetImage( foto?.path ?? 'assets/img/no-image.png'),
        height: 300,
        fit: BoxFit.cover
      );
    }
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
      //Si esta guardando, retorne un null (para deshabilitar el boton), si no, habilite el boton con la funcion.
      onPressed: _guardando? null : _submit,
    );
  }
  //----FIN WIDGET'S DEL BUILD----//

  //---FUNCIONES---//
  void _seleccionarFoto() async{
    foto = await ImagePicker.pickImage(
      source: ImageSource.gallery
    );

    if(foto != null){
      //Limpieza
    }

    setState(() {});
  }
  void _tomarFoto(){

  }
  void _submit(){
    //Si el formulario es incorrecto, no realiza el codigo
    if(!formKey.currentState.validate()) return;

    //Esta linea hara el save, de los campos del formulario
    formKey.currentState.save();

    //Bandera para el guardado de elementos (deshabilitar el boton de guardar)
    setState(() {_guardando = true;});

    //Servicio REST para crear o editar un producto en la DB.
    if(producto.id == null){
      productosProvider.crearProducto(producto);
    } else
      productosProvider.editarProducto(producto);
    
    //Bandera para el guardado de elementos (deshabilitar el boton de guardar)
    setState(() {_guardando = false;});

    //Este mensaje aparecera, cuando se guarde los datos
    mostrarSnackBar(context, 'Registro guardado');
    //Si despues de guardar/editar, se quiere salir de la pagina
    //Navigator.pop(context);
  }
  void mostrarSnackBar(BuildContext context, String mensaje){

    final snackbar = SnackBar(
      content: Text(mensaje),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }
  //--FIN FUNCIONES--//













}