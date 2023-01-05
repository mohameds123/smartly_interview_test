import 'package:get_it/get_it.dart';
import 'package:movies/Store/data/datasourse/store_remote_data_source.dart';
import 'package:movies/Store/data/repo/product_repo.dart';
import 'package:movies/Store/domain/repo/base_store_repo.dart';
import 'package:movies/Store/domain/usecase/get_all_products_usecase.dart';
import 'package:movies/Store/domain/usecase/get_product_detail_usecase.dart';
import 'package:movies/Store/presentation/controllers/product_details_bloc.dart';
import 'package:movies/Store/presentation/controllers/products_bloc.dart';



final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    ///Bloc
    sl.registerFactory(() => StoreBloc(sl()));
    sl.registerFactory(() => ProductDetailsBloc(sl()));

    ///Products Use Cases
    sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));

    sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseStoreRepo>(() => StoreRepo(sl()));

    ///Data Source
    sl.registerLazySingleton<BaseStoreRemoteDataSource>(() => StoreRemoteDataSource());

  }
}