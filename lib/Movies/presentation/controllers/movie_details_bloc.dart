import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies/Movies/presentation/controllers/movie_details_evets.dart';
import 'package:movies/Movies/presentation/controllers/movie_details_state.dart';
import 'package:movies/core/utils/enums.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvents, MovieDetailsState> {
  GetMovieDetailUsesCase getMovieDetailUsesCase;
  GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(
    this.getMovieDetailUsesCase,
    this.getRecommendationUseCase,
  ) : super(MovieDetailsState()) {
    ///Get Movie Details Event
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await getMovieDetailUsesCase(
          MovieDetailsParameters(movieId: event.id));
      result.fold(
          (l) => emit(state.copyWith(
                movieDetailsState: RequestStates.error,
                movieDetailMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                movieDetail: r,
                movieDetailsState: RequestStates.loaded,
              )));
    });

    ///Get Recommendation Event
    on<GetMovieRecommendationEvent>((event, emit) async {
      final result = await getRecommendationUseCase(
          RecommendationParameters(movieId: event.id));
      result.fold(
          (l) => emit(state.copyWith(
                recommendationStates: RequestStates.error,
                recommendationMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                recommendation: r,
                recommendationStates: RequestStates.loaded,
              )));
    });
  }
}
