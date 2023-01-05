import 'package:dartz/dartz.dart';
import 'package:movies/Store/data/datasourse/store_remote_data_source.dart';
import 'package:movies/Store/domain/entities/produts.dart';
import 'package:movies/Store/domain/repo/base_store_repo.dart';
import 'package:movies/Store/domain/usecase/get_product_detail_usecase.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/error/failure.dart';

class StoreRepo extends BaseStoreRepo{
  BaseStoreRemoteDataSource baseStoreRemoteDataSource;

  StoreRepo(this.baseStoreRemoteDataSource);

  @override
  Future<Either<Failure,List<Products>>> getAllProducts()async {
    final result = await baseStoreRemoteDataSource.getAllProducts();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Products>> getProductDetails(ProductDetailsParameters parameters)async {
    final result = await baseStoreRemoteDataSource.getProductsDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }
}