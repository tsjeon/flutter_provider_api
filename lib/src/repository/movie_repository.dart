import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterprovider/src/model/movie.dart';

// import '../model/movie.dart';

class MovieRepository {
  Future<List<Movie>> loadMovies() async {
    var queryParameters = {
      'api_key': '5564e7a95cb1eea2b834b98e9d4e2f97',
    }; // https://www.themoviedb.org/ 제공하는 api key
    var uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', queryParameters);
    var response = await http.get(uri);

    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list.map<Movie>((item) => Movie.fromJson(item)).toList();
      }
    }
  }
}
