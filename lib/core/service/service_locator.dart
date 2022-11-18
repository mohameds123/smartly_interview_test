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
import 'package:movies/TVs/data/datasourse/tv_data_source.dart';
import 'package:movies/TVs/data/repo/tv_repo.dart';
import 'package:movies/TVs/domain/repo/base_tv_repo.dart';
import 'package:movies/TVs/domain/usecase/get_on_theair_tv_usecase.dart';
import 'package:movies/TVs/domain/usecase/get_popular_tv_usecase.dart';
import 'package:movies/TVs/domain/usecase/get_top_rated_tv_uscase.dart';
import 'package:movies/TVs/domain/usecase/get_tv_details_use_case.dart';
import 'package:movies/TVs/presentation/controllers/tv_bloc.dart';
import 'package:movies/TVs/presentation/controllers/tv_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    ///Bloc
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    sl.registerFactory(() => TvBloc(sl(),sl(),sl()));
    sl.registerFactory(() => TvDetailsBloc(sl()));
    ///Movie Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUsesCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    ///Tv Use Cases
    sl.registerLazySingleton(() => GetOnTheAirTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
    ///Repository
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(sl()));
    sl.registerLazySingleton<BaseTvRepo>(() => TvRepo(sl()));
    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MoviesRemoteDataSource());
    sl.registerLazySingleton<BaseTvRemoteDataSource>(() => TvRemoteDataSource());
  }
}