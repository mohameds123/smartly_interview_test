import 'package:equatable/equatable.dart';
import 'package:movies/TVs/domain/entities/tv_detail.dart';
import 'package:movies/core/utils/enums.dart';

class TvDetailsState extends Equatable{
  final  TvDetails? tvDetails;
  final RequestStates tvDetailsState;
  final String tvDetailsMessage;

  const TvDetailsState({
    this.tvDetails,
    this.tvDetailsState = RequestStates.loading,
    this.tvDetailsMessage = '',
  });
  TvDetailsState copyWith({
     TvDetails ?tvDetails,
    RequestStates? tvDetailsState,
    String? tvDetailsMessage,
  }){
    return TvDetailsState(
      tvDetails: tvDetails ?? this.tvDetails,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
    );
  }
  @override
  List<Object?> get props => [
    tvDetails,
    tvDetailsState,
    tvDetailsMessage,
  ];
}