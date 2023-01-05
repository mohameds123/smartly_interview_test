import 'package:dartz/dartz.dart';
import 'package:movies/Store/domain/entities/produts.dart';
import 'package:movies/Store/domain/usecase/get_product_detail_usecase.dart';
import 'package:movies/core/error/failure.dart';

abstract class BaseStoreRepo {
  Future <Either<Failure,List<Products>>>getAllProducts();

  Future <Either<Failure,Products>> getProductDetails(ProductDetailsParameters parameters);



}