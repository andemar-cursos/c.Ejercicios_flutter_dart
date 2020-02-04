//Terceros
import 'package:latlong/latlong.dart';

class ScanModel {
  int id;
  String tipo;
  String valor;

  ScanModel({
      this.id,
      this.tipo,
      this.valor,
  }){
    if(this.valor.contains('.com')){
      this.tipo = 'http';
    }else
      this.tipo = 'geo';
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
      id    : json["id"],
      tipo  : json["tipo"],
      valor : json["valor"],
  );

  Map<String, dynamic> toJson() => {
      "id"    : id,
      "tipo"  : tipo,
      "valor" : valor,
  };

  //Retorna la Latitud y longitud con tipo LatLng
  LatLng getLatLng(){
    //geo:3.4517276203872265,-76.5467120691193
    //[3.4517276203872265, -76.5467120691193]
    final lalo = valor.substring(4).split(',');
    final lat = double.parse(lalo[0]);
    final lng = double.parse(lalo[1]);

    return LatLng(lat, lng);
  }
}