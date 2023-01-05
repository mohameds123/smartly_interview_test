import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Store/domain/usecase/get_all_products_usecase.dart';
import 'package:movies/core/usecases/base_usecase.dart';
import 'package:movies/core/utils/enums.dart';

import 'products_events.dart';
import 'products_state.dart';

class StoreBloc extends Bloc<StoreEvent, ProductsState> {
  GetAllProductsUseCase getAllProductsUseCase;

  StoreBloc(this.getAllProductsUseCase)
      : super(const ProductsState()) {
    ///GetAllProductsEvent
    on<GetAllProductsEvent>((event, emit) async {
      final result = await getAllProductsUseCase(const NoParameters());
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
  }
}
