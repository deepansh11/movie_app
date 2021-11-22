import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Models/movies_model.dart';

import 'package:movie_app/apis/endpoint_ulrs.dart';

final movieServiceProvider = Provider<Movie>((ref) => Movie(Dio()));

final topRatedFutureProvider =
    FutureProvider.autoDispose<List<MovieModel>>((ref) async {
  ref.maintainState = true;

  final movieService = ref.watch(movieServiceProvider);
  final movies = await movieService.topRated();

  return movies;
});

class Movie {
  final Dio _dio;

  Movie(this._dio);

  get function => null;

  Future<List<MovieModel>> topRated() async {
    final topRatedResponse = await _dio.get(Endpoints.topRatedUrl(1));

    final results =
        List<Map<String, dynamic>>.from(topRatedResponse.data['results']);

    List<MovieModel> movies =
        results.map((movieData) => MovieModel.fromMap(movieData)).toList();

    return movies;
  }
}
