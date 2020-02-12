import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bloc/src/providers/animes_info_provider.dart';

class SuperText extends StatelessWidget {

  final estiloTexto = TextStyle(fontSize: 30.0, color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    
    //Intancia del provider
    final animeInfo = Provider.of<AnimesInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(animeInfo.anime, style: estiloTexto),
      ],
    );
  }
}