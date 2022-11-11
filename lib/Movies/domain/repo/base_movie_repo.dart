import 'package:dartz/dartz.dart';
import 'package:movies/Movies/domain/entities/movie.dart';
import 'package:movies/Movies/domain/entities/movie_detail.dart';
import 'package:movies/Movies/domain/entities/recommendation.dart';
import 'package:movies/Movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies/core/error/failure.dart';

abstract class BaseMovieRepo {
  Future <Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future <Either<Failure,List<Movie>>> getPopularMovies();

  Future <Either<Failure,List<Movie>>> getTopRatedMovies();

  Future <Either<Failure,MovieDetail>> getMovieDetail(MovieDetailsParameters parameters);

  Future <Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

}