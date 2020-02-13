//Terceros
import 'package:beats/src/models/producto_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//Providers
import 'package:beats/src/providers/productos_provider.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productosProvider = Provider.of<ProductosProvider>(context);

    return Container(
      width: double.infinity,
      height: 460.0,
      child: PageView(
        controller: PageController(viewportFraction: 0.79),
        /* children: <Widget>[
          _Card(),
          _Card(),
        ],*/
        children: productosProvider.productos.map((prod) => _Card(prod)).toList(),
      ),
    );
  }
}


class _Card extends StatelessWidget {

  ProductoModel producto;

  _Card(this.producto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[

          Row(
            children: <Widget>[
              _firtsDescription(producto),
              SizedBox(width: 55.0),
              _tarjetaDescripcion(context, producto),
            ],
          ),

          Positioned(
            top: 90,
            left: 50,
            child: Image(
              image: AssetImage('assets/img/${producto.url}'),  
              width: 160.0,
            ),
          ),
        ],
      ),
    );
  }
  Widget _firtsDescription(ProductoModel producto){

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.batteryFull, size: 15.0),
            SizedBox(width: 10),
            Text('${producto.bateria}-Hour Battery', style: TextStyle(fontSize: 12.0),),

            SizedBox(width: 30.0),
            
            Icon(FontAwesomeIcons.wifi, size: 15.0),
            SizedBox(width: 10),
            Text('Wireless', style: TextStyle(fontSize: 12.0),),

          ],
        ),
      ),
    );
  }
  Widget _tarjetaDescripcion(BuildContext context, ProductoModel producto){

    final size = MediaQuery.of(context).size;

    return Card(
      //Sombra
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: size.width * 0.55,
          height: 340,
          //Hexadecimal. se pox 0x luego la transparencia ff y luego el color 0B3...
          //color:Color(0xff0B3FA2),
          color: Color(producto.color),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25.0),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(producto.titulo, style: TextStyle(color: Colors.white24, fontSize: 30.0, fontWeight: FontWeight.bold)),
                    Text(producto.subtitulo, style: TextStyle(color: Colors.white24, fontSize: 30.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              Spacer(),

              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(producto.nombre, style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart, color: Colors.white)
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text('\$${producto.precio}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    width: 80,
                  ),
                  Container(
                    width: 120.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0)),
                    ),
                    child: Center(
                      child: Text('Add to bag', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}













