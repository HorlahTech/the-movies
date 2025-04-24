import 'package:http/http.dart' as network;

class Controller{
  Future<void> getUpcomingMovies() async {

    var url = Uri.https('api.themoviedb.org', '/3/movie/upcoming');
var response = await network.get(url);
print(response);
  }
}