class Cast{
  List<Actor> actores = new List();

  Cast.jsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    jsonList.forEach((data){
      final actor = Actor.fromJsonMap(data);
      actores.add(actor);
    });
  }
}



class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json){
    castId      = json['cast_id'];
    character   = json['character'];
    creditId    = json['credit_id'];
    gender      = json['gender'];
    id          = json['id'];
    name        = json['name'];
    order       = json['order'];
    profilePath = json['profile_path'];
  }


  getfoto(){
    //Si no hay poster, retorna una imagen por defeceto
    if(profilePath == null){
      return 'https://apps.co/uploads/user/567a69dfcd394f20bd34eda7f1a89a0a/img.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}