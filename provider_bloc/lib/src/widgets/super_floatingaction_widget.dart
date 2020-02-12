//Terceros
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Provider
import 'package:provider_bloc/src/providers/animes_info_provider.dart';

class SuperFloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final animeInfo = Provider.of<AnimesInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.accessible_forward),
          backgroundColor: Colors.redAccent,
          onPressed: () => animeInfo.anime = 'Sword art online'
        ),

        SizedBox(height: 10.0),

        FloatingActionButton(
          child: Icon(Icons.directions_run),
          backgroundColor: Colors.blue,
          onPressed: () => animeInfo.anime = 'Clannad'
        ),

      ],
    );
  }
}