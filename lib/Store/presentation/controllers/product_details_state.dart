import 'package:equatable/equatable.dart';
import 'package:movies/Store/domain/entities/produts.dart';
import 'package:movies/core/utils/enums.dart';

class ProductDetailsState extends Equatable {
  final Products? productDetail;
  final RequestStates productDetailsState;
  final String productDetailMessage;

  const ProductDetailsState({
    this.productDetailMessage = '',
    this.productDetailsState = RequestStates.loading,
    this.productDetail,
  });

  ProductDetailsState copyWith({
    Products? productDetail,
    RequestStates? productDetailsState,
    String? productDetailMessage,
  }) {
    return ProductDetailsState(
      productDetailMessage: productDetailMessage ?? this.productDetailMessage,
      productDetail: productDetail ?? this.productDetail,
      productDetailsState: productDetailsState ?? this.productDetailsState,
    );
  }

  @override
  List<Object?> get props => [
        productDetail,
        productDetailsState,
        productDetailMessage,
      ];
}
