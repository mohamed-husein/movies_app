import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/tv/domain/use_case/on_the_air_use_case.dart';
import 'package:movies_app/tv/domain/use_case/popular_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/top_rated_tv_use_case.dart';
import 'package:movies_app/tv/presentation/controller/tv_show_event.dart';
import 'package:movies_app/tv/presentation/controller/tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvents, TvShowStates> {
  final GetOnTheAirTvShow getOnTheAirTvShow;
  final GetPopularTvUseCase getPopularTvUseCase;
  final GetTopRatedTvUseCase getTopRatedTvUseCase;

  TvShowBloc(
      {required this.getOnTheAirTvShow,
      required this.getTopRatedTvUseCase,
      required this.getPopularTvUseCase})
      : super(const TvShowStates()) {
    on<OnTheAirTvShowEvent>(_getOnTheAirTvShow);
    on<PopularTvShowEvent>(_getPopularTvShow);
    on<TheTopRatedTvShowEvent>(_getTheTopRatedTvShow);
  }

  FutureOr<void> _getOnTheAirTvShow(
      OnTheAirTvShowEvent event, Emitter<TvShowStates> emit) async {
    final result = await getOnTheAirTvShow.call(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            onTheAirState: RequestState.loading, onTheAirMessage: l.message)),
        (r) => emit(state.copyWith(
            onTheAirTvShow: r, onTheAirState: RequestState.loaded)));


  }

  FutureOr<void> _getPopularTvShow(
      PopularTvShowEvent event, Emitter<TvShowStates> emit) async {
    final result = await getPopularTvUseCase.call(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.loading, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularTvShow: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTheTopRatedTvShow(
      TheTopRatedTvShowEvent event, Emitter<TvShowStates> emit) async {
    final result = await getTopRatedTvUseCase.call(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            theTopRatedState: RequestState.loading,
            theTopRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            theTopRatedTvShow: r, theTopRatedState: RequestState.loaded)));
  }
}
