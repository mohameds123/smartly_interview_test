import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_pupolar_movies_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_toprated_movies_usecase.dart';
import 'package:movies/Movies/presentation/controllers/movie_events.dart';
import 'package:movies/Movies/presentation/controllers/movie_state.dart';
import 'package:movies/core/usecases/base_usecase.dart';
import 'package:movies/core/utils/enums.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(this.getNowPlayingMoviesUseCase, this.getTopRatedMoviesUseCase,
      this.getPopularMoviesUseCase)
      : super(MovieState()) {
    ///GetNowPlayingEvent
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
            nowPlayingState: RequestStates.error,
            message: l.message,
          )),
          (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestStates.loaded),
        ),
      );
    });

    ///GetPopularEvent
    on<GetPopularEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParameters());
      result.fold(
            (l) => emit(state.copyWith(
          popularMoviesState: RequestStates.error,
          message: l.message,
        )),
            (r) => emit(
          state.copyWith(
              popularMovies: r,
              popularMoviesState: RequestStates.loaded),
        ),
      );
    });

    ///GetTopRatedEvent
    on<GetTopRatedEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(const NoParameters());
      result.fold(
            (l) => emit(state.copyWith(
          topRatedState: RequestStates.error,
          message: l.message,
        )),
            (r) => emit(
          state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestStates.loaded),
        ),
      );
    });
  }
}
