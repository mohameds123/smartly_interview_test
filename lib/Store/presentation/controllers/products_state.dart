import 'package:equatable/equatable.dart';
import 'package:movies/Store/domain/entities/produts.dart';
import 'package:movies/core/utils/enums.dart';

class ProductsState extends Equatable {
  final List<Products> allProducts;
  final String message;
  final RequestStates allProductsState;

  const ProductsState({
    this.allProducts = const [],
    this.message = '',
    this.allProductsState = RequestStates.loading,
  });

  ProductsState copyWith({
    List<Products>? nowPlayingMovies,
    String? message,
    RequestStates? nowPlayingState,
    RequestStates? popularMoviesState,
    RequestStates? topRatedState,
  }) {
    return ProductsState(
      allProducts: nowPlayingMovies ?? this.allProducts,
      allProductsState: nowPlayingState ?? this.allProductsState,
    );
  }

  @override
  List<Object?> get props => [
        allProducts,
        allProductsState,
        message,
      ];
}
