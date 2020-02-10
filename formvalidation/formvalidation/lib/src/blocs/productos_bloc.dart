//Terceros
import 'dart:io';
import 'package:rxdart/rxdart.dart';
//Providers
import 'package:formvalidation/src/providers/productos_provider.dart';
//Modelos
import 'package:formvalidation/src/models/producto_model.dart';

class  ProductosBloc{

  //Instancia Behavior para el uso de streams.s
  final _productosController = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _productosProvider = new ProductosProvider();

  //Stream de obtencion de lista y cargando
  Stream<List<ProductoModel>> get productosStream => _productosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;


  //Metodo encargado de la carga de productos
  void cargarProductos() async{
    //Obtiene la lista de productos de la db
    final productos = await _productosProvider.cargarProducos();
    //Se envia la lista por el stream
    _productosController.sink.add(productos);
  }

  //Metodo que agrega un producto a la db.
  void agregarProducto(ProductoModel producto) async{
    //Bandera de carga
    _cargandoController.sink.add(true);
    //Servicio para crear el producto
    await _productosProvider.crearProducto(producto);
    //Bandera de carga
    _cargandoController.sink.add(false);

  }
  
  //Metodo para subir una imagen
  Future<String> subirFoto(File imagen) async{
    //Bandera de carga
    _cargandoController.sink.add(true);
    //Servicio para subir una imagen
    final fotoUrl = await _productosProvider.subirImagen(imagen);
    //Bandera de carga
    _cargandoController.sink.add(false);

    return fotoUrl;
  }

  //Metodo para editar un producto
  void editarProducto(ProductoModel producto) async{
    //Bandera de edicion
    _cargandoController.sink.add(true);
    //Servicio para editar un producto
    await _productosProvider.editarProducto(producto);
    //Bandera de edicion
    _cargandoController.sink.add(false);

  }

  //Metodo para eliminar un producto segun el id
  void borrarProducto(String id) async{
    //Servicio para borrar producto -> No se necesita la bandera, ya que 
    //los efectos material dan suficiente tiempo.
    await _productosProvider.borrarProducto(id);

  }


  disponse(){
    _productosController?.close();
    _cargandoController?.close();
  }
}