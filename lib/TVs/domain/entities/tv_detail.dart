import 'package:equatable/equatable.dart';
import 'package:movies/TVs/domain/entities/tv_genres.dart';

class TvDetails extends Equatable{
  final int id;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String lastAirDate;
  final int runtime;
  final List<TvGenres> genres;
  const TvDetails({
    required this.id,
    required this.backdropPath,
    required  this.overview,
    required this.voteAverage,
    required this.lastAirDate,
    required this.runtime,
    required this.genres,
  });
  @override
  List<Object?> get props =>[
    id,
    backdropPath,
    overview,
    voteAverage,
    lastAirDate,
    runtime,
    genres,
  ];
}