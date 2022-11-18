import 'package:movies/TVs/domain/entities/tv_genres.dart';

class TvGenresModel extends TvGenres {
  const TvGenresModel({required int id, required String name})
      : super(id: id, name: name);

  factory TvGenresModel.fromJson(Map<String, dynamic> json) =>
      TvGenresModel(id: json['id'], name: json['name']);
}
