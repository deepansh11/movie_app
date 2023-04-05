// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:movie_app/apis/api_constant.dart';

class MovieModel {
  final String? title;
  final int? id;
  final String? releaseDate;
  final String? poster_path;
  final String? backdrop_path;
  final num? vote_average;
  final String? overview;

  String get fullPosterPathUrl =>
      TMDB_BASE_IMAGE_URL + 'w342' + poster_path.toString();
  String get fullBackDropPathUrl =>
      TMDB_BASE_IMAGE_URL + 'original' + backdrop_path.toString();

  MovieModel({
    this.title,
    this.poster_path,
    this.backdrop_path,
    this.overview,
    this.id,
    this.vote_average,
    this.releaseDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': poster_path,
      'backdrop_path': backdrop_path,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': vote_average,
      'id': id,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'],
      poster_path: map['poster_path'],
      backdrop_path: map['backdrop_path'],
      overview: map['overview'],
      releaseDate: map['release_date'],
      vote_average: map['vote_average'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
