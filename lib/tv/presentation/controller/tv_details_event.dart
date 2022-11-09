part of 'tv_details_bloc.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();
}

class GetTvDetailsEvent extends TvDetailsEvent{

  final int tvId;
  const GetTvDetailsEvent({required this.tvId});
  @override
  List<Object?> get props => [tvId];
}

class GetTvRecommendationsEvent extends TvDetailsEvent{
  final int tvId;
  const GetTvRecommendationsEvent({required this.tvId});
  @override
  List<Object?> get props => [tvId];
}

class GetTvVideosEvent extends TvDetailsEvent{
  final int tvId;
  const GetTvVideosEvent({required this.tvId});
  @override
  List<Object?> get props => [tvId];
}

class GetTvEpisodesEvent extends TvDetailsEvent{
  final int tvId;
  final int seasonNum;
  const GetTvEpisodesEvent({required this.tvId,required this.seasonNum});
  @override
  List<Object?> get props => [tvId];
}
