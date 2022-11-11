import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvents extends Equatable{
  const MovieDetailsEvents();
  List<Object?> get props =>[];
}
class GetMovieDetailsEvent extends MovieDetailsEvents{
  final int id;
  const GetMovieDetailsEvent(this.id);

}
class GetMovieRecommendationEvent extends MovieDetailsEvents{
  final int id;
  const GetMovieRecommendationEvent(this.id);
}