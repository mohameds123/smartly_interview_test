import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/TVs/domain/usecase/get_on_theair_tv_usecase.dart';
import 'package:movies/TVs/domain/usecase/get_popular_tv_usecase.dart';
import 'package:movies/TVs/domain/usecase/get_top_rated_tv_uscase.dart';
import 'package:movies/TVs/presentation/controllers/tv_events.dart';
import 'package:movies/TVs/presentation/controllers/tv_states.dart';
import 'package:movies/core/usecases/base_usecase.dart';
import 'package:movies/core/utils/enums.dart';

class TvBloc extends Bloc<TvEvents, TvState> {
  GetOnTheAirTvUseCase getOnTheAirTvUseCase;
  GetPopularTvUseCase getPopularTvUseCase;
  GetTopRatedTvUseCase getTopRatedTvUseCase;

  TvBloc(this.getOnTheAirTvUseCase, this.getPopularTvUseCase,
      this.getTopRatedTvUseCase)
      : super(const TvState()) {
    ///GetOnAirTvEvent
    on<GetOnTheAirTvEvent>((event, emit) async {
      final result = await getOnTheAirTvUseCase(const NoParameters());
      result.fold(
            (l) => emit(state.copyWith(
          onTheAirTvRequestState: RequestStates.error,
          onTheAirTvMessage: l.message,
        )),
            (r) => emit(
          state.copyWith(
              onTheAirTv: r,
              onTheAirTvRequestState: RequestStates.loaded),
        ),
      );
    });

    ///GetPopularTvEvent
    on<GetPopularTvEvent>((event, emit) async {
      final result = await getPopularTvUseCase(const NoParameters());
      result.fold(
            (l) => emit(state.copyWith(
          popularTvRequestState: RequestStates.error,
          popularTvMessage: l.message,
        )),
            (r) => emit(
          state.copyWith(
              popularTv: r,
              popularTvRequestState: RequestStates.loaded),
        ),
      );
    });

    ///GetTopRatedTvEvent
    on<GetTopRatedTvEvent>((event, emit) async {
      final result = await getTopRatedTvUseCase(const NoParameters());
      result.fold(
            (l) => emit(state.copyWith(
          topRatedTvRequestState: RequestStates.error,
          topRatedTvMessage: l.message,
        )),
            (r) => emit(
          state.copyWith(
              topRatedTv: r,
              topRatedTvRequestState: RequestStates.loaded),
        ),
      );
    });
  }
}
