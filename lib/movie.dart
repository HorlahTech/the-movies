class Movie{
  final String poster;
  final String title;
  final String releaseDate;
  final String desc;
  Movie({required this.desc, required this.title, required this.poster, required this.releaseDate});
factory Movie.fromJson( Map<String, dynamic>json){
 final String titl =  json["title"];
 final String descr = json["overview"];
 final String pst = json["poster_path"];
 final String date = json["release_date"];
  return Movie(desc: descr, title: titl, poster: pst, releaseDate: date);
}
}