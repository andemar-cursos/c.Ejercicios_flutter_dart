class Peliculas{

  //Variables
  List<Pelicula> peliculas = new List();

  //Constructor
  Peliculas();

  //Metodos
  Peliculas.fromJsonList(List<dynamic> jsonList){

    if(jsonList == null) return;

    for(var item in jsonList){
      final pelicula = new Pelicula.fromJsonMap(item);
      peliculas.add(pelicula);
    }
  }
}


class Pelicula {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json){
    //Esto se hace, para que el valor si lleva entero, lo vuelva double
    popularity        = json['popularity'] / 1.0;
    voteCount         = json['vote_count'];  
    video             = json['video'];  
    posterPath        = json['poster_path'];   
    id                = json['id']; 
    adult             = json['adult'];  
    backdropPath      = json['backdrop_path'];  
    originalLanguage  = json['original_language'];  
    originalTitle     = json['original_title'];  
    //Esto es para que vuelva el dato a int
    genreIds          = json['genre_ids'].cast<int>();
    title             = json['title'];  
    voteAverage       = json['vote_average'] / 1.0;  
    overview          = json['overview']; 
    releaseDate       = json['release_date'];  
  } 

  getPosterImg(){
    //Si no hay poster, retorna una imagen por defeceto
    if(posterPath == null){
      return 'https://www.itl.cat/pngfile/big/156-1567134_use-d20-code-to-apply-this-offer-available.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }


  getBackGroundImg(){
    //Si no hay poster, retorna una imagen por defeceto
    if(posterPath == null){
      return 'https://www.itl.cat/pngfile/big/156-1567134_use-d20-code-to-apply-this-offer-available.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }

}