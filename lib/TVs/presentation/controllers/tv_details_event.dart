import 'package:equatable/equatable.dart';

class TvDetailsEvents extends Equatable{
  @override
  List<Object?> get props => [];
}
class GetTvDetailsEvent extends TvDetailsEvents{
  final int id;
  GetTvDetailsEvent(this.id);
}