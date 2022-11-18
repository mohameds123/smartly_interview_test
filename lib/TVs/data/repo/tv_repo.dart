import 'package:dartz/dartz.dart';
import 'package:movies/TVs/data/datasourse/tv_data_source.dart';
import 'package:movies/TVs/domain/entities/tv.dart';
import 'package:movies/TVs/domain/entities/tv_detail.dart';
import 'package:movies/TVs/domain/repo/base_tv_repo.dart';
import 'package:movies/TVs/domain/usecase/get_tv_details_use_case.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/error/failure.dart';

class TvRepo extends BaseTvRepo{
  BaseTvRemoteDataSource baseTvRemoteDataSource;
   TvRepo(this.baseTvRemoteDataSource);
  @override
  Future<Either<Failure, List<Tv>>> getOnTheAir() async {
   final result = await baseTvRemoteDataSource.getOnAitTv();
   try{
     return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv()  async {
    final result = await baseTvRemoteDataSource.getPopularTv();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    final result = await baseTvRemoteDataSource.getTopRatedTv();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(TvDetailsParameters parameters) async {
    final result = await baseTvRemoteDataSource.getTvDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }
}