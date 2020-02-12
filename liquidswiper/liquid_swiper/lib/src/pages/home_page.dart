import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swiper/src/widgets/liquid_pages_widget.dart' as liquidWidget;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Retorna un widget, el cual se encarga de mostrar el efecto
      body: LiquidSwipe(
        //Se llama la lista de containers a mostrar
        pages: liquidWidget.liquidPages,
        //Velocidad de la animacion
        fullTransitionValue: 500,
        //Habilitar bucle de iniciar cuando llega al fin
        enableLoop: true,
        //Habilitar flecha
        enableSlideIcon: true,
        //Posicion de la flecha
        positionSlideIcon: 0.8,
        //Tipo de animacion
        waveType: WaveType.circularReveal, //WaveType.liquidReveal
        //Llamado cuando se cambia una pagina
        onPageChangeCallback: (page) => pageChangeCallBack(page),
        //Llamado cuando se actualiza una pagina
        currentUpdateTypeCallback: (updateType) => updateTypeCallBack(updateType),
      ),
    );
  }

  //Recibe la pagina a la cual se cambio
  pageChangeCallBack(int page){
    print(page);
  }

  //Se recibe un updateType.. ni idea.
  updateTypeCallBack(UpdateType updateType){
    print(updateType);
  }










}