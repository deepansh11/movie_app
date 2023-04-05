import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Models/fake_movie.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/Models/video_model.dart';

import '../Services/movies.dart';

final movieServiceProvider = Provider<Movie>((ref) => Movie());

final fakeMovieServiceProvider = Provider<Movie>((ref) => FakeMovies());

final topRatedFutureProvider = FutureProvider<List<MovieModel>>((ref) async {
  final movieService = ref.watch(movieServiceProvider);
  final movies = await movieService.topRated();

  return movies;
});

final upcomingFutureProvider = FutureProvider<List<MovieModel>>((ref) async {
  final movieService = ref.watch(movieServiceProvider);
  final movies = await movieService.upcomingMovies();

  return movies;
});

final popularFutureProvider = FutureProvider<List<MovieModel>>((ref) async {
  final movieService = ref.watch(movieServiceProvider);
  final movies = await movieService.popularMovies();

  return movies;
});

final getVideoKeyFutureProvider =
    FutureProvider.family((ref, int movieId) async {
  final movieService = ref.watch(movieServiceProvider);
  final video = await movieService.getVideoUrl(movieId);

  return video;
});
