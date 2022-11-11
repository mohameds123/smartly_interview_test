import 'package:movies/Movies/data/model/genres_model.dart';
import 'package:movies/Movies/domain/entities/genres.dart';
import 'package:movies/Movies/domain/entities/movie_detail.dart';

class DetailsModel extends MovieDetail {
  const DetailsModel(
      {required int id,
      required String backdropPath,
      required String title,
      required String overview,
      required double voteAverage,
      required String releaseDate,
      required int runtime,
      required List<Genres> genres})
      : super(
            id: id,
            backdropPath: backdropPath,
            title: title,
            overview: overview,
            voteAverage: voteAverage,
            releaseDate: releaseDate,
            runtime: runtime,
            genres: genres);

  factory DetailsModel.fromJson (Map<String ,dynamic> json)=>DetailsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
      genres: List<GenresModel>.from(
          json['genres'].map((x)=>GenresModel.fromJson(x))),
      runtime: json['runtime'],
  );
}
