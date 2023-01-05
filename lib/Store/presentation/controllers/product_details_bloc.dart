import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Store/domain/usecase/get_product_detail_usecase.dart';
import 'package:movies/core/utils/enums.dart';
import 'product_details_evets.dart';
import 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvents, ProductDetailsState> {
  GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc(
    this.getProductDetailsUseCase,
  ) : super(const ProductDetailsState()) {
    ///Get Product Details Event
    on<GetProductDetailsEvent>((event, emit) async {
      final result = await getProductDetailsUseCase(
          ProductDetailsParameters(productId: event.id));
      result.fold(
          (l) => emit(state.copyWith(
                productDetailsState: RequestStates.error,
                productDetailMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                productDetail: r,
                productDetailsState: RequestStates.loaded,
              )));
    });
  }
}
