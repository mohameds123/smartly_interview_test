import 'package:dartz/dartz.dart';
import 'package:movies/TVs/domain/entities/tv.dart';
import 'package:movies/TVs/domain/repo/base_tv_repo.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecases/base_usecase.dart';

class GetPopularTvUseCase extends BaseUseCase <List<Tv>,NoParameters>{
  final BaseTvRepo baseTvRepo;
  GetPopularTvUseCase(this.baseTvRepo);
  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async{
    return await baseTvRepo.getPopularTv();
  }
}