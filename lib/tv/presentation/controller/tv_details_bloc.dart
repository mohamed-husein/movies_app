import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/tv/domain/entities/tv_details.dart';
import 'package:movies_app/tv/domain/entities/tv_episode.dart';
import 'package:movies_app/tv/domain/entities/tv_recommendations.dart';
import 'package:movies_app/tv/domain/entities/tv_videos.dart';
import 'package:movies_app/tv/domain/use_case/episode_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/recommendations_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/tv_details_use_case.dart';
import 'package:movies_app/tv/domain/use_case/videos_tv_use_case.dart';

import '../screens/tv_details_screen.dart';

part 'tv_details_event.dart';

part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetDetailsTvShow getDetailsTvShow;
  final GetRecommendationsTvShow getRecommendationsTvShow;
  final GetVideosTvShow getVideosTvShow;
  final GetEpisodesTvShow getEpisodesTvShow;



  TvDetailsBloc({
    required this.getEpisodesTvShow,
    required this.getVideosTvShow,
    required this.getRecommendationsTvShow,
    required this.getDetailsTvShow,
  }) : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetTvRecommendationsEvent>(_getTvRecommendations);
    on<GetTvVideosEvent>(_getTvVideos);
    on<GetTvEpisodesEvent>(_getTvEpisodes);
  }


  FutureOr<void> _getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await getDetailsTvShow.call(TvDetailsParameters(tvId: event.tvId));


    result.fold(
        (l) => emit(state.copyWith(
            tvDetailsMessage: l.message,
            tvDetailsState: RequestState.loading)), (r) {
      seasonNum = r.season.length;
      emit(state.copyWith(tvDetails: r, tvDetailsState: RequestState.loaded));
    });
    log(result.toString());
    log(seasonNum.toString());

  }

  FutureOr<void> _getTvRecommendations(
      GetTvRecommendationsEvent event, Emitter<TvDetailsState> emit) async {
    final result = await getRecommendationsTvShow
        .call(TvRecommendationsParameters(tvId: event.tvId));

    result.fold(
        (l) => emit(state.copyWith(
            tvRecommendationsMessage: l.message,
            tvRecommendationsState: RequestState.loading)),
        (r) => emit(state.copyWith(
            tvRecommendations: r,
            tvRecommendationsState: RequestState.loaded)));
  }

  FutureOr<void> _getTvEpisodes(
      GetTvEpisodesEvent event, Emitter<TvDetailsState> emit) async {
    final result = await getEpisodesTvShow.call(
        TvEpisodesParameters(tvId: event.tvId, seasonNum: event.seasonNum));
    result.fold(
        (l) => emit(state.copyWith(
            tvEpisodesMessage: l.message,
            tvEpisodesState: RequestState.loading)),
        (r) => emit(state.copyWith(
            tvEpisodes: r, tvEpisodesState: RequestState.loaded)));
  }

  FutureOr<void> _getTvVideos(
      GetTvVideosEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await getVideosTvShow.call(VideosParameters(tvId: event.tvId));
    result.fold(
        (l) => emit(state.copyWith(
            tvVideosMessage: l.message, tvVideosState: RequestState.loading)),
        (r) => emit(
            state.copyWith(tvVideos: r, tvVideosState: RequestState.loaded)));
  }


}
