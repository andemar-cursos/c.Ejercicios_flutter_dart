//Terceros
import 'package:flutter/material.dart';
//Paginas
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hiddendrawermenu/src/pages/firts_page.dart';
import 'package:hiddendrawermenu/src/pages/seconds_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    //Se anade la lista de item's que aparecera
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Pagina 1',
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.teal,
        ),
        FirtsPage()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: 'Pagina 2',
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
        ),
        SecondsPage()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _crearHiddenMenu();
  }


  Widget _crearHiddenMenu(){
    //Retorna un hidden, con sus respectivos atributos.
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.blueGrey,
      backgroundColorAppBar: Colors.cyan,
      screens: items,
        //    typeOpen: TypeOpen.FROM_RIGHT,
        //    enableScaleAnimin: true,
        //    enableCornerAnimin: true,
        //    slidePercent: 80.0,
        //    verticalScalePercent: 80.0,
        //    contentCornerRadius: 10.0,
        //    iconMenuAppBar: Icon(Icons.menu),
        //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
        //    whithAutoTittleName: true,
        //    styleAutoTittleName: TextStyle(color: Colors.red),
        //    actionsAppBar: <Widget>[],
        //    backgroundColorContent: Colors.blue,
        //    elevationAppBar: 4.0,
        //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
        //    enableShadowItensMenu: true,
        backgroundMenu: DecorationImage(image: AssetImage('assets/img/crop.jpg'),fit: BoxFit.cover),
    );
  }

















}