import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:movie_app/Models/movies_model.dart';

class Movies with ChangeNotifier {
  final String apikey = '11d2ac79e0343be1884452c8d757b9a5';

  List<MoviesModel> _movies = [];

  List<MoviesModel> get movies {
    return [..._movies];
  }

  Future<void> showMovies() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey');

    try {
      final response = await http.get(url);
      var results = json.decode(response.body);
      // ignore: unnecessary_null_comparison
      if (results == null) {
        return;
      }
      Map<String, dynamic> extractedData = results;

      final List<MoviesModel> loadedMovies = [];

      extractedData.forEach((key, value) {
        print(key);
        print(value);
      });
    } catch (e) {
      throw e;
    }
  }
}
