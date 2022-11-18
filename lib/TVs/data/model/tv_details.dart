import 'package:movies/TVs/data/model/genres_model.dart';
import 'package:movies/TVs/domain/entities/tv_detail.dart';
import 'package:movies/TVs/domain/entities/tv_genres.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel(
      {required int id,
      required String backdropPath,
      required String overview,
      required double voteAverage,
      required String lastAirDate,
      required int runtime,
      required List<TvGenres> genres})
      : super(
            id: id,
            backdropPath: backdropPath,
            overview: overview,
            voteAverage: voteAverage,
            lastAirDate: lastAirDate,
            runtime: runtime,
            genres: genres);

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        lastAirDate: json['last_air_date'],
        genres: List<TvGenresModel>.from(
            json['genres'].map((x) => TvGenresModel.fromJson(x))),
        runtime: json['runtime']??0,
      );
}
