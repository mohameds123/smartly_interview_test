import 'package:dartz/dartz.dart';
import 'package:movies/TVs/domain/entities/tv.dart';
import 'package:movies/TVs/domain/entities/tv_detail.dart';
import 'package:movies/TVs/domain/usecase/get_tv_details_use_case.dart';
import 'package:movies/core/error/failure.dart';

abstract class BaseTvRepo {
  Future<Either<Failure,List<Tv>>> getOnTheAir();
  Future<Either<Failure,List<Tv>>> getPopularTv();
  Future<Either<Failure,List<Tv>>> getTopRatedTv();
  Future<Either<Failure,TvDetails>> getTvDetails(TvDetailsParameters parameters);
}