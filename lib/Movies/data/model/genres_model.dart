import 'package:movies/Movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required int id, required String name})
      : super(id: id, name: name);

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(id: json['id'], name: json['name']);
}
