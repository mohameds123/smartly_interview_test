import 'package:dio/dio.dart';
import 'package:movies/TVs/data/model/tv_details.dart';
import 'package:movies/TVs/data/model/tv_model.dart';
import 'package:movies/TVs/domain/usecase/get_tv_details_use_case.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/api_constant.dart';
import 'package:movies/core/network/error_model.dart';

abstract class BaseTvRemoteDataSource{
  Future<List<TvModel>> getOnAitTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
  Future<TvDetailsModel> getTvDetails(TvDetailsParameters parameters);
}
class TvRemoteDataSource extends BaseTvRemoteDataSource{
  @override
  Future<List<TvModel>> getOnAitTv() async {
    Response response = await Dio().get(ApiConstance.onTheAirTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data['results'] as List).map(
            (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async{
    Response response = await Dio().get(ApiConstance.popularTvPath);
    if(response.statusCode == 200){
      return List<TvModel>.from((response.data['results']as List).map((e) => TvModel.fromJson(e)));
    }else{
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async{
    Response response = await Dio().get(ApiConstance.topRatedTvPath);
    if(response.statusCode == 200){
      return List<TvModel>.from((response.data['results']as List).map((e) => TvModel.fromJson(e)));
    }else{
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(TvDetailsParameters parameters) async {
    Response response = await Dio().get(ApiConstance.tvDetailsPath(parameters.id));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}