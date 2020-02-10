//Terceros
import 'package:flutter/material.dart';
//Bloc
import 'package:formvalidation/src/models/producto_model.dart';
//Provider
import 'package:formvalidation/src/blocs/provider.dart';
//Paginas
import 'producto_page.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'HomePage';
  
  @override
  Widget build(BuildContext context) {

    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }


  //Widget's
  Widget _crearListado(ProductosBloc productosBloc){

    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
       if(snapshot.hasData){

         final productos = snapshot.data;

         return ListView.builder(
           itemCount: productos.length,
           itemBuilder: (context, i) => _crearItem(context, productos[i],productosBloc),
          );
       }else
        return Center(child: CircularProgressIndicator());
      },
    );
  }
  Widget _crearItem(BuildContext context ,ProductoModel producto, ProductosBloc productosBloc){

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      //Llamado al servicio REST -> Mediante bloc
      onDismissed: (direccion) => productosBloc.borrarProducto(producto.id),
      child: Card(
        child: Column(
          children: <Widget>[
            //Si la imagen es null, se pone no-img
            (producto.fotoUrl == null)
            ? Image(image: AssetImage('assets/img/no-image.png'))
            //Si hay, se crea un fade, obteniendola de la url del producto
            : FadeInImage(
            placeholder: AssetImage('assets/img/jar-loading.gif'),
            image: NetworkImage(producto.fotoUrl) 
            ),
            
            ListTile( title: Text('${producto.titulo} - ${producto.valor}'),
            subtitle: Text('ID: ${producto.id}'),
            //Se envia por argumento el producto seleccionado por el usuario.
            onTap: () => Navigator.pushNamed(context, ProductoPage.routeName, arguments: producto)),
          ],
        ),
      )
        
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