//Terceros
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc/src/providers/animes_info_provider.dart';
//Widgets
import 'package:provider_bloc/src/widgets/super_floatingaction_widget.dart';
import 'package:provider_bloc/src/widgets/super_text_widget.dart';
//Paginas

class HomePage extends StatelessWidget { 

  

  static final String ROUTE_NAME = 'HomePage';

  @override
  Widget build(BuildContext context) {

    //Providers
    final animeInfo = Provider.of<AnimesInfo>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text(animeInfo.anime),
      ),
      body: Center(
        child: SuperText()
      ),
      floatingActionButton: SuperFloatingAction(),

    );
  }
}