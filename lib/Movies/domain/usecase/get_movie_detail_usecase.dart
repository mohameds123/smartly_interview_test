import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/Movies/domain/entities/movie_detail.dart';
import 'package:movies/Movies/domain/repo/base_movie_repo.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecases/base_usecase.dart';

class GetMovieDetailUsesCase extends BaseUseCase <MovieDetail,MovieDetailsParameters>{
  final BaseMovieRepo baseMovieRepo;
  GetMovieDetailUsesCase(this.baseMovieRepo);
  @override
  Future <Either<Failure,MovieDetail>> call(MovieDetailsParameters parameters)async{
    return await baseMovieRepo.getMovieDetail(parameters);
  }
}
class MovieDetailsParameters extends Equatable{
  final int movieId;
  const MovieDetailsParameters ({required this.movieId});

  @override
  List<Object?> get props =>[
    movieId
  ];

}