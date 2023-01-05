import 'package:dio/dio.dart';
import 'package:movies/Store/data/model/product_model.dart';
import 'package:movies/Store/domain/usecase/get_product_detail_usecase.dart';

import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/api_constant.dart';
import 'package:movies/core/network/error_model.dart';

abstract class BaseStoreRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future <ProductModel> getProductsDetails(ProductDetailsParameters parameters);

}
class StoreRemoteDataSource extends BaseStoreRemoteDataSource{
  @override
  Future<List<ProductModel>> getAllProducts()async {
    Response response = await Dio().get(ApiConstance.getAllProductsPath);
    if (response.statusCode == 200) {
      return List<ProductModel>.from((response.data as List).map(
            (e) => ProductModel.fromJson(e),
      ));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<ProductModel> getProductsDetails(ProductDetailsParameters parameters)async {
    Response response = await Dio().get(ApiConstance.productDetailsPath(parameters.productId));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

}


