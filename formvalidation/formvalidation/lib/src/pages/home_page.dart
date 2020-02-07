//Terceros
import 'package:flutter/material.dart';
//Bloc
import 'package:formvalidation/src/blocs/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
//Provider
import 'package:formvalidation/src/providers/productos_provider.dart';
//Paginas
import 'producto_page.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'HomePage';
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }


  //Widget's
  Widget _crearListado(){

   return FutureBuilder(
     future: productosProvider.cargarProducos(),
     builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
       if(snapshot.hasData){

         final productos = snapshot.data;

         return ListView.builder(
           itemCount: productos.length,
           itemBuilder: (context, i) => _crearItem(context, productos[i]),
          );
       }else
        return Center(child: CircularProgressIndicator());
     },
   );
  }
  Widget _crearItem(BuildContext context ,ProductoModel producto){

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion){
        //Llamado al servicio REST
        productosProvider.borrarProducto(producto.id);
      },
      child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text('ID: ${producto.id}'),
        //Se envia por argumento el producto seleccionado por el usuario.
        onTap: () => Navigator.pushNamed(context, ProductoPage.routeName, arguments: producto)
      ),
    );
  }
  
  Widget _crearBoton(BuildContext context){

    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor:  Theme.of(context).primaryColor,
      onPressed: ()=> Navigator.pushNamed(context, ProductoPage.routeName)
    );
  }

  






















}