import 'package:dartz/dartz.dart';
import 'package:movies/Store/domain/entities/produts.dart';
import 'package:movies/Store/domain/repo/base_store_repo.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecases/base_usecase.dart';

class GetAllProductsUseCase extends BaseUseCase<List<Products>,NoParameters> {
  final BaseStoreRepo baseStoreRepo;

  GetAllProductsUseCase(this.baseStoreRepo);
  @override
  Future <Either<Failure,List<Products>>> call(NoParameters parameters)async{
    return await baseStoreRepo.getAllProducts();
  }
}