import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/Models/video_model.dart';
import 'package:movie_app/Services/movie_exceptions.dart';

import 'package:movie_app/apis/endpoint_ulrs.dart';

import 'base_service.dart';

class Movie extends BaseService {
  Future<List<MovieModel>> topRated() async {
    try {
      final response = await dio.get(Endpoints.topRatedUrl(1));

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<MovieModel> movies =
          results.map((movieData) => MovieModel.fromMap(movieData)).toList();

      return movies;
    } on MoviesException catch (e, s) {
      print('$e, $s');
      return [];
    }
  }

  Future<List<MovieModel>> popularMovies() async {
    try {
      final response = await dio.get(Endpoints.getPopularUrl(1));

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<MovieModel> movies =
          results.map((movieData) => MovieModel.fromMap(movieData)).toList();

      return movies;
    } on MoviesException catch (e, s) {
      print('$e, $s');
      return [];
    }
  }

  Future<List<MovieModel>> upcomingMovies() async {
    try {
      final response = await dio.get(Endpoints.getUpcomingUrl(1));

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<MovieModel> movies =
          results.map((movieData) => MovieModel.fromMap(movieData)).toList();

      return movies;
    } on MoviesException catch (e, s) {
      // TODO
      print('$e,$s');
      return [];
    }
  }

  Future<List<VideoModel>?> getVideoUrl(int movieId) async {
    try {
      final response = await dio.get(Endpoints.getTrailerKey(movieId));

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<VideoModel> videos =
          results.map((movieData) => VideoModel.fromMap(movieData)).toList();

      return videos;
    } on MoviesException catch (e, s) {
      // TODO
      print('$e,$s');
      return [];
    }
  }
}
