import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/TVs/domain/usecase/get_tv_details_use_case.dart';
import 'package:movies/TVs/presentation/controllers/tv_details_event.dart';
import 'package:movies/TVs/presentation/controllers/tv_details_states.dart';
import 'package:movies/core/utils/enums.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvents,TvDetailsState> {
  GetTvDetailsUseCase getTvDetailsUseCase;

  TvDetailsBloc(this.getTvDetailsUseCase,)
      : super(const TvDetailsState()) {
    ///GetTvDetailsEvent
    on<GetTvDetailsEvent>((event, emit) async {
      final result = await getTvDetailsUseCase(
          TvDetailsParameters(id: event.id));
      result.fold(
            (l) =>
            emit(state.copyWith(
              tvDetailsState: RequestStates.error,
              tvDetailsMessage: l.message,
            )),
            (r) =>
            emit(
              state.copyWith(
                  tvDetails: r,
                  tvDetailsState: RequestStates.loaded),
            ),
      );
    });
  }
}
