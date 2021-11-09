import 'dart:convert';

import 'package:movie_app/apis/api_constant.dart';

class MovieModel {
  String? title;
  String? releaseDate;
  String? poster_path;
  String? backdrop_path;
  double? popularity;
  String? description;

  String get fullPosterPathUrl => TMDB_BASE_IMAGE_URL + 'w342' + poster_path!;
  String get fullBackDropPathUrl =>
      TMDB_BASE_IMAGE_URL + 'original' + backdrop_path!;

  MovieModel(
      {this.title,
      this.poster_path,
      this.backdrop_path,
      this.description,
      this.popularity,
      this.releaseDate});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': poster_path,
      'backdrop_path': backdrop_path,
      'overview': description,
      'release_date': releaseDate,
      'popularity': popularity,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
        title: map['title'] != null ? map['title'] : null,
        poster_path: map['poster_path'] != null ? map['poster_path'] : null,
        backdrop_path:
            map['backdrop_path'] != null ? map['backdrop_path'] : null,
        description: map['overview'] != null ? map['overview'] : null,
        releaseDate: map['release_date'] != null ? map['release_date'] : null,
        popularity: map['popularity'] != null ? map['popularity'] : null);
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
