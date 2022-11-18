import 'package:movies/TVs/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({required int id, required String backdropPath,required String originalName})
      : super(id: id, backdropPath: backdropPath, originalName: originalName);

  factory TvModel.fromJson (Map<String ,dynamic> json)=>TvModel(
    id: json['id'],
    originalName: json['original_name'],
    backdropPath: json['backdrop_path']??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ91m2RK2wNj8kUXCxHI9z-Wel7Ws4eKRNAb08DHEblh2Qr5KkzvnQ0l2Vl-EyAUH9HNvA&usqp=CAU',
  );
}
