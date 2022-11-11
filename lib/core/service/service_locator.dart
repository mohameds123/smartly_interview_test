import 'package:get_it/get_it.dart';
import 'package:movies/Movies/data/datasourse/movies_remote_data_source.dart';
import 'package:movies/Movies/data/repo/movie_repo.dart';
import 'package:movies/Movies/domain/repo/base_movie_repo.dart';
import 'package:movies/Movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_pupolar_movies_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_toprated_movies_usecase.dart';
import 'package:movies/Movies/presentation/controllers/movie_bloc.dart';
import 'package:movies/Movies/presentation/controllers/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    ///Bloc
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    ///Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUsesCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    ///Repository
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(sl()));

    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MoviesRemoteDataSource());
  }
}