import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/tv/domain/entities/tv_show.dart';

class TvShowStates extends Equatable {
  final List<TvShow> onTheAirTvShow;
  final RequestState onTheAirState;
  final String onTheAirMessage;

  final List<TvShow> popularTvShow;
  final RequestState popularState;
  final String popularMessage;

  final List<TvShow> theTopRatedTvShow;
  final RequestState theTopRatedState;
  final String theTopRatedMessage;

  const TvShowStates({
    this.onTheAirTvShow = const [],
    this.onTheAirState = RequestState.loading,
    this.onTheAirMessage = '',
    this.popularTvShow = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.theTopRatedTvShow = const [],
    this.theTopRatedState = RequestState.loading,
    this.theTopRatedMessage = '',
  });

  TvShowStates copyWith({
    final List<TvShow>? onTheAirTvShow,
    final RequestState? onTheAirState,
    final String? onTheAirMessage,
    final List<TvShow>? popularTvShow,
    final RequestState? popularState,
    final String? popularMessage,
    final List<TvShow>? theTopRatedTvShow,
    final RequestState? theTopRatedState,
    final String? theTopRatedMessage,
  }) {
    return TvShowStates(
      onTheAirTvShow: onTheAirTvShow ?? this.onTheAirTvShow,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      onTheAirState: onTheAirState ?? this.onTheAirState,
      popularTvShow: popularTvShow ?? this.popularTvShow,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.onTheAirMessage,
      theTopRatedTvShow: theTopRatedTvShow ?? this.theTopRatedTvShow,
      theTopRatedState: theTopRatedState ?? this.theTopRatedState,
      theTopRatedMessage: theTopRatedMessage ?? this.theTopRatedMessage,
    );
  }

  @override
  List<Object> get props => [
        onTheAirTvShow,
        onTheAirState,
        onTheAirMessage,
        popularTvShow,
        popularState,
        popularMessage,
        theTopRatedTvShow,
        theTopRatedState,
        theTopRatedMessage,
      ];
}
