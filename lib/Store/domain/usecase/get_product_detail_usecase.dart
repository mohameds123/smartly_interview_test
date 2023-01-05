import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/Store/domain/entities/produts.dart';
import 'package:movies/Store/domain/repo/base_store_repo.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecases/base_usecase.dart';

class GetProductDetailsUseCase extends BaseUseCase <Products,ProductDetailsParameters>{
  final BaseStoreRepo baseStoreRepo;
  GetProductDetailsUseCase(this.baseStoreRepo);
  @override
  Future <Either<Failure,Products>> call(ProductDetailsParameters parameters)async{
    return await baseStoreRepo.getProductDetails(parameters);
  }
}
class ProductDetailsParameters extends Equatable{
  final int productId;
  const ProductDetailsParameters ({required this.productId});

  @override
  List<Object?> get props =>[
    productId
  ];

}