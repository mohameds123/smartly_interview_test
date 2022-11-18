import 'package:equatable/equatable.dart';
import 'package:movies/TVs/domain/entities/tv.dart';
import 'package:movies/core/utils/enums.dart';

class TvState extends Equatable{
  final List <Tv> onTheAirTv;
  final List <Tv> popularTv;
  final List <Tv> topRatedTv;
  final RequestStates onTheAirTvRequestState;
  final RequestStates popularTvRequestState;
  final RequestStates topRatedTvRequestState;
  final String onTheAirTvMessage;
  final String popularTvMessage;
  final String topRatedTvMessage;

  const TvState({
    this.onTheAirTv = const[],
    this.onTheAirTvRequestState = RequestStates.loading,
    this.onTheAirTvMessage = '',
    this.popularTv = const[],
    this.popularTvRequestState  = RequestStates.loading,
    this.popularTvMessage = '',
    this.topRatedTv = const[],
    this.topRatedTvRequestState  = RequestStates.loading,
    this.topRatedTvMessage = '',
});
  TvState copyWith({
    List<Tv>? onTheAirTv,
    List<Tv>? popularTv,
    List<Tv> ?topRatedTv,
    RequestStates? onTheAirTvRequestState,
    RequestStates? popularTvRequestState,
    RequestStates? topRatedTvRequestState,
    String? onTheAirTvMessage,
    String? popularTvMessage,
    String? topRatedTvMessage,
  }){
    return TvState(
      onTheAirTv: onTheAirTv ?? this.onTheAirTv,
      popularTv: popularTv ?? this.popularTv,
      topRatedTv: topRatedTv ?? this.topRatedTv,
      onTheAirTvRequestState: onTheAirTvRequestState ?? this.onTheAirTvRequestState,
      popularTvRequestState: popularTvRequestState ?? this.popularTvRequestState,
      topRatedTvRequestState: topRatedTvRequestState ?? this.topRatedTvRequestState,
      onTheAirTvMessage: onTheAirTvMessage ?? this.onTheAirTvMessage,
      popularTvMessage: popularTvMessage ?? this.popularTvMessage,
      topRatedTvMessage: topRatedTvMessage ?? this.topRatedTvMessage,
    );
  }
  @override
  List<Object?> get props => [
    onTheAirTv,
    onTheAirTvRequestState,
    onTheAirTvMessage,
    popularTv,
    popularTvRequestState,
    popularTvMessage,
    topRatedTv,
    topRatedTvRequestState,
    topRatedTvMessage,
  ];
}