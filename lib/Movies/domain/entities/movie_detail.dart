import 'package:equatable/equatable.dart';
import 'package:movies/Movies/domain/entities/genres.dart';

class MovieDetail extends Equatable{
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<Genres> genres;
  const MovieDetail({
    required this.id,
    required this.backdropPath,
    required this.title,
    required  this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
});
  @override
  List<Object?> get props =>[
    id,
    backdropPath,
    title,
    overview,
    voteAverage,
    releaseDate,
    runtime,
    genres,
  ];
}