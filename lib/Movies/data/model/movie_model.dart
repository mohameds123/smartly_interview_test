import 'package:movies/Movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required int id,
      required String backdropPath,
      required String title,
      required String overview,
      required double voteAverage,
      required List<int> genreIds,
      required String releaseDate})
      : super(
            id: id,
            backdropPath: backdropPath,
            title: title,
            overview: overview,
            voteAverage: voteAverage,
            genreIds: genreIds,
            releaseDate: releaseDate);

  factory MovieModel.fromJson (Map<String ,dynamic> json)=>MovieModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
      genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
  );
}
