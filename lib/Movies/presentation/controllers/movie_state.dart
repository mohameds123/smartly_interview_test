import 'package:equatable/equatable.dart';
import 'package:movies/Movies/domain/entities/movie.dart';
import 'package:movies/core/utils/enums.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;

  final String message;
  final RequestStates nowPlayingState;
  final RequestStates popularMoviesState;
  final RequestStates topRatedState;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.message = '',
    this.nowPlayingState = RequestStates.loaded,
    this.popularMoviesState = RequestStates.loaded,
    this.topRatedState = RequestStates.loaded,
    this.popularMovies = const [],
    this.topRatedMovies = const [],
  });
  MovieState copyWith({
     List<Movie>? nowPlayingMovies,
     List<Movie>? popularMovies,
     List<Movie> ?topRatedMovies,
     String? message,
     RequestStates? nowPlayingState,
     RequestStates? popularMoviesState,
     RequestStates? topRatedState,
}){
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        topRatedMovies,
        topRatedState,
        popularMovies,
        popularMoviesState,
        message,
      ];
}
