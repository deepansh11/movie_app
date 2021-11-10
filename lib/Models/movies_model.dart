import 'dart:convert';

import 'package:movie_app/apis/api_constant.dart';

class MovieModel {
  String? title;
  int? id;
  String? releaseDate;
  String? poster_path;
  String? backdrop_path;
  double? popularity;
  String? overview;

  String get fullPosterPathUrl => TMDB_BASE_IMAGE_URL + 'w342' + poster_path!;
  String get fullBackDropPathUrl =>
      TMDB_BASE_IMAGE_URL + 'original' + backdrop_path!;

  MovieModel(
      {this.title,
      this.poster_path,
      this.backdrop_path,
      this.overview,
      this.id,
      this.popularity,
      this.releaseDate});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': poster_path,
      'backdrop_path': backdrop_path,
      'overview': overview,
      'release_date': releaseDate,
      'popularity': popularity,
      'id': id,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'] != null ? map['title'] : null,
      poster_path: map['poster_path'] != null ? map['poster_path'] : null,
      backdrop_path: map['backdrop_path'] != null ? map['backdrop_path'] : null,
      overview: map['overview'] != null ? map['overview'] : null,
      releaseDate: map['release_date'] != null ? map['release_date'] : null,
      popularity: map['popularity'] != null ? map['popularity'] : null,
      id: map['id'] != null ? map['id'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
