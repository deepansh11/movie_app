import 'package:dio/src/dio_error.dart';
import 'package:dio/src/dio.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/Models/video_model.dart';
import 'package:movie_app/Services/base_service.dart';
import 'package:movie_app/Services/movies.dart';

class FakeMovies extends BaseService implements Movie {
  @override
  Future<List<VideoModel>?> getVideoUrl(int movieId) {
    // TODO: implement getVideoUrl
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> popularMovies() async {
    return [
      MovieModel(
        id: 0,
        title: 'Test Movie',
        overview:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        releaseDate: '1970-1-1',
        vote_average: 6.2,
        poster_path:
            'https://images.unsplash.com/photo-1679678691256-fa3ce50c2159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1253&q=80',
        backdrop_path:
            'https://images.unsplash.com/photo-1679678691256-fa3ce50c2159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1253&q=80',
      )
    ];
  }

  @override
  Future<List<MovieModel>> topRated() async {
    return [
      MovieModel(
        id: 0,
        title: 'Test Movie',
        overview:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        releaseDate: '1970-1-1',
        vote_average: 6.2,
        poster_path:
            'https://images.unsplash.com/photo-1679678691256-fa3ce50c2159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1253&q=80',
        backdrop_path:
            'https://images.unsplash.com/photo-1679678691256-fa3ce50c2159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1253&q=80',
      )
    ];
  }

  @override
  Future<List<MovieModel>> upcomingMovies() async {
    return [
      MovieModel(
        id: 0,
        title: 'Test Movie',
        overview:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        releaseDate: '1970-1-1',
        vote_average: 6.2,
        poster_path:
            'https://images.unsplash.com/photo-1679678691256-fa3ce50c2159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1253&q=80',
        backdrop_path:
            'https://images.unsplash.com/photo-1679678691256-fa3ce50c2159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1253&q=80',
      )
    ];
  }
}
