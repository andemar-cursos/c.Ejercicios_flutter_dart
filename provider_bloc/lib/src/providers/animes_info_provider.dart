//Terceros
import 'package:flutter/material.dart';


class AnimesInfo with ChangeNotifier{

  String _animes = 'clannad';

  get anime{
    return _animes;
  }

  set anime(String anime){
    _animes = anime;

    notifyListeners();
  }
}