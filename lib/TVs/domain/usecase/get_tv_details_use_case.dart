import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/TVs/domain/entities/tv_detail.dart';
import 'package:movies/TVs/domain/repo/base_tv_repo.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecases/base_usecase.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails,TvDetailsParameters>{
  BaseTvRepo baseTvRepo;
  GetTvDetailsUseCase(this.baseTvRepo);
  @override
  Future<Either<Failure, TvDetails>> call(TvDetailsParameters parameters)async {
  return await baseTvRepo.getTvDetails(parameters);
  }
}

class TvDetailsParameters extends Equatable{
  final int id;
  const TvDetailsParameters({required this.id});

  @override
  List<Object?> get props => [id];
}