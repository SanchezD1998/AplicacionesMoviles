import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=e3fd37e8dd3eca6eecb8808906be73bc';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  //final String urlLanguage = '&language=en-US';
  final String urlSearchBase = 'https://api.themoviedb.org/3/search/movie?api_key=e3fd37e8dd3eca6eecb8808906be73bc&query=';

  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey;
    http.Response result = await http.get(Uri.parse(upcoming));
    //var myResult = await http.get(Uri.parse(upcoming));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null!;
    }
  }

  Future<List> findMovies(String title) async {
    final String query = urlSearchBase + title ;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    }
    else {
      return null!;
    }  }
}
