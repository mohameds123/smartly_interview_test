import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/Movies/domain/entities/recommendation.dart';
import 'package:movies/Movies/domain/repo/base_movie_repo.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecases/base_usecase.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetRecommendationUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) {
    return baseMovieRepo.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
