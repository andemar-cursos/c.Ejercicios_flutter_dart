//Terceros
import 'package:beats/src/widgets/card_view_widget.dart';
import 'package:beats/src/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
//Widgets
import 'package:beats/src/widgets/fondo_circular_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {

  static final String ROUTE_NAME = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FondoCircular(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAppBar(),
                  _header(),
                  CardsView(),
                ],
              ),
            )
          ),
          _buyBotton(context),
        ],
      ),
    );
  }
  Widget _header(){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 90),
          Text('Beats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
          Text('By dre', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0)),
        ],
      ),
    );
  }
  Widget _buyBotton(BuildContext context){

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            width: size.width * 0.35,
            height: size.height * 0.09,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Buy', 
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 20.0
                  ),
                ),
                SizedBox(width: 10.0),
                Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
              ],
            ),
          ),
        )
      ],
    );
  }












}