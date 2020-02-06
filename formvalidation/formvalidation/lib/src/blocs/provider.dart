import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget{

  final loginBloc = LoginBloc();

  Provider({Key key, Widget child})
    : super(key:key, child:child);

  //Esto permite notificar el 100% de los llamados del Stream.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;


  static LoginBloc of(BuildContext context){
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).loginBloc;
  }




}