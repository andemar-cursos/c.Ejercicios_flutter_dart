//Terceros
import 'package:flutter/material.dart';
//Bloc
import 'package:formvalidation/src/blocs/provider.dart';
//Provider
import 'package:formvalidation/src/providers/usuario_provider.dart';
//Utilidades
import 'package:formvalidation/src/utils/utils.dart';
//Page
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/registro_page.dart';

class LoginPage extends StatelessWidget {

  static final String routeName = 'LoginPage';

  final usuarioProvider = new UsuarioProvider();
  //Build
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      )
    );
  }
  //-----

  //-------------WIDGETS-----------//

  //Widget fondo
  Widget _crearFondo(BuildContext context){
    //tamano de la pantalla
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      //Este es el 40% de la pantalla
      height: size.height * 0.4,
      //Coge el total del ancho
      width: double.infinity,
      //Para crear un gradiente lineal
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.1),
      ),
    );

    final info = Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0,),
          //El witdh sirve para ocupar todo el ancho y que el container quede centrado
          SizedBox(height: 10.0, width: double.infinity,),
          Text('Andemar', style: TextStyle(color: Colors.white, fontSize: 25.0),),
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(child: circulo, top: 90.0, left: 30.0,),
        Positioned(child: circulo, top: -40.0, right: -30.0,),
        Positioned(child: circulo, bottom: -50.0, right: -10.0,),
        Positioned(child: circulo, bottom: 120.0, right: 20.0,),
        Positioned(child: circulo, bottom: -50.0, left: -20.0,),
        info,
      ],
    );
  }
  //--------

  //Widget Login
  Widget _loginForm(BuildContext context){

    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);
    
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //Este SafeArea mueve los elementos a un area seguro, mas 230 pixeles
          SafeArea(
            child: Container(
              height: 230,
            ),
          ),
          _cajaLogin(size, bloc),
          _crearBotonRegistro(context),
          //Esto permite que la caja no quede pegada en la esquina, cuando la pantalla esta en horizontal
          SizedBox(height: 100.0),
        ],
      ),
    );
  }
  Widget _cajaLogin(Size size, LoginBloc bloc){

    return Container(
      //La caja sera del 85% del ancho de la pantalla
      width: size.width * 0.85,
      //Este me separar de los elementos exteriores de la caja
      margin: EdgeInsets.symmetric(vertical: 30.0),
      //Este separa los elementos interiores de la caja
      padding: EdgeInsets.symmetric(vertical: 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            //Esto indica el color de la sombre (Opacidad de 26)
            color: Colors.black26,
            //Este el blur que contendra la sombra
            blurRadius: 3.0,
            //Este expandira mas el blue
            spreadRadius: 3.0,
            //Este la posicion que tendra la sombra
            offset: Offset(0.0, 5.0),
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Text('Ingreso', style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 40.0),
          _crearEmail(bloc),
          SizedBox(height: 20.0),
          _crearPass(bloc),
          SizedBox(height: 20.0),
          _crearBoton(bloc),
        ],
      ),
    ); 
  }
  Widget _crearEmail(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          //Esto permite separar la caja de los bordes
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          //Label del correo
          child: TextField(
            //Al desplegar el teclado, es de tipo email
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
              //Este es el texto, al oprimir el label
              hintText: 'ejemplo@correo.com',
              //Estees el texto, cuando no se ha oprimido el label
              labelText: 'Correo Electronico',
              //test
              //counterText: snapshot.data,
              errorText: snapshot.error
            ),
            //onChanged: (value) => bloc.changeEmail(value),   //<-- Esto es lo mismo
            onChanged: bloc.changeEmail,
          ),
        );  
      },
    );
  }
  Widget _crearPass(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.passStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          //Esto permite separar la caja de los bordes
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          //Label del pass
          child: TextField(
            //Permite ocultar la pass cuando se escribe
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Contrasena',
              //Test
              //counterText: snapshot.data,
              //Este obtendra los datos, si la validacion no es correcta
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePass,
          )
          
        );
      },
    );
  }
  Widget _crearBoton(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //Es un boton con el tema basado en material
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            //Bordes redondeados del boton
            borderRadius: BorderRadius.circular(5.0)
          ),
          //Esto evita que el boton tenga sombra
          elevation: 0.0,
          //Color del boton
          color: Colors.deepPurple,
          //Color del texto
          textColor: Colors.white,
          //Si hay data del blocfromValidStream, retorna una funcion, si no, null.
          //Si el hay data, significa que el email y el pass, fueron correctos.
          onPressed: snapshot.hasData? ()=>_login(context, bloc) : null, 
        );  
      },
    );
  }
  Widget _crearBotonRegistro(BuildContext context){

    return FlatButton(
      onPressed: () => Navigator.pushReplacementNamed(context, RegistroPage.routeName),
      child: Text('Crear una nueva cuenta'),
    );
  }
  //----


  //----------FUNCIONES------------//
  _login(BuildContext context, LoginBloc bloc) async{

    Map resp = await usuarioProvider.login(bloc.email, bloc.pass);

    if(resp['ok']){
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }else{
      mostrarAlerta(context, resp['mensaje']);
    }
  }






























}