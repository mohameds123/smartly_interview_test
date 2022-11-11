import 'package:dartz/dartz.dart';
import 'package:movies/Movies/domain/entities/movie.dart';
import 'package:movies/Movies/domain/repo/base_movie_repo.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecases/base_usecase.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetPopularMoviesUseCase(this.baseMovieRepo);
  @override
  Future <Either<Failure,List<Movie>>> call(NoParameters parameters)async{
    return await baseMovieRepo.getPopularMovies();
  }
}