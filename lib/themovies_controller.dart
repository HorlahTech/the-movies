import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart'  as network;
import 'package:new_movies/movie.dart';

class Controller{
  Future<List<Movie>?> getUpcomingMovies() async {
    // https://api.themoviedb.org/3/movie/upcoming
    // "api_key": "9d8b230d70306544726af9857b0a863d"
    const String apiKey = "api_key=9d8b230d70306544726af9857b0a863d";
    var url = Uri.https('api.themoviedb.org', '/3/movie/upcoming');
final network.Response response = await network.get(url,
    headers:{"Authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZDhiMjMwZDcwMzA2NTQ0NzI2YWY5ODU3YjBhODYzZCIsIm5iZiI6MTc0NDI3NjQ1MS4wNTMsInN1YiI6IjY3Zjc4YmUzZDNhYjdkN2E4YmFkM2U5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ys3BoFjdj8Wjp9DaYzynfn_gXquk-A3OSCjEiQftvNI",} );
    log("This is the response ${response.body}");
if(response.statusCode == 200){

 final data = jsonDecode(response.body);
final list = data["results"] as List;
 return list.map((element)=> Movie.fromJson(element)).toList();


} else{
  return null;
}
  }




}