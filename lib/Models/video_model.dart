import 'dart:convert';

class VideoModel {
  final String? name;
  final String? id;
  final String? key;

  VideoModel({this.name, this.id, this.key});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'release_date': key,
      'id': id,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      name: map['name'],
      key: map['key'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source));
}
