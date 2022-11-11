import 'package:equatable/equatable.dart';
import 'package:movies/Movies/domain/entities/movie_detail.dart';
import 'package:movies/Movies/domain/entities/recommendation.dart';
import 'package:movies/core/utils/enums.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final List<Recommendation>? recommendation;
  final RequestStates recommendationStates;
  final RequestStates movieDetailsState;
  final String recommendationMessage;
  final String movieDetailMessage;

  const MovieDetailsState({
    this.movieDetailMessage = '',
    this.movieDetailsState = RequestStates.loading,
    this.movieDetail,
    this.recommendation,
    this.recommendationMessage = '',
    this.recommendationStates = RequestStates.loading,
  });

  MovieDetailsState copyWith(
      {MovieDetail? movieDetail,
      RequestStates? movieDetailsState,
      String? movieDetailMessage,
      List<Recommendation>? recommendation,
      RequestStates? recommendationStates,
      String? recommendationMessage}) {
    return MovieDetailsState(
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendation: recommendation ?? this.recommendation,
      recommendationStates: recommendationStates ?? this.recommendationStates,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        movieDetailMessage,
        recommendationMessage,
        recommendation,
        recommendationStates,
      ];
}
