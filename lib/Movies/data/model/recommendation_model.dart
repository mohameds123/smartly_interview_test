import 'package:movies/Movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required String backdropPath, required int id})
      : super(backdropPath: backdropPath, id: id);

  factory RecommendationModel.fromJson (Map<String ,dynamic> json)=>RecommendationModel(
    id: json['id'],
    backdropPath: json['backdrop_path']??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ91m2RK2wNj8kUXCxHI9z-Wel7Ws4eKRNAb08DHEblh2Qr5KkzvnQ0l2Vl-EyAUH9HNvA&usqp=CAU',
  );
}
