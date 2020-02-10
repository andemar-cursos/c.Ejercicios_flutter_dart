//Terceros
import 'package:flutter/material.dart';
//Bloc
import 'package:formvalidation/src/blocs/login_bloc.dart';
export 'package:formvalidation/src/blocs/login_bloc.dart';
import 'package:formvalidation/src/blocs/productos_bloc.dart';
export 'package:formvalidation/src/blocs/productos_bloc.dart';

class Provider extends InheritedWidget{
  //Blocs
  final loginBloc = LoginBloc();
  //Se debe declarar privado
  final _productosbloc = new ProductosBloc();

  static Provider _instancia;

  factory Provider({Key key, Widget child}){

    if( _instancia == null){
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

    Provider._internal({Key key, Widget child})
    : super(key:key, child:child);



  //Esto permite notificar el 100% de los llamados del Stream.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;


  static LoginBloc of(BuildContext context){
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).loginBloc;
  }

  static ProductosBloc productosBloc(BuildContext context){
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider )._productosbloc;
  }










}