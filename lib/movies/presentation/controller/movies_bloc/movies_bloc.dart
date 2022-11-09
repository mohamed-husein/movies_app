import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/use_case/get_now_playing.dart';
import 'package:movies_app/movies/domain/use_case/get_popular_movies.dart';
import 'package:movies_app/movies/domain/use_case/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlaying getNowPlaying;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;

  MoviesBloc(this.getNowPlaying, this.getPopularMovies, this.getTopRatedMovies)
      : super(const MoviesState()) {
    on<NowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<PopularMoviesEvent>(_getPopularMovies);

    on<TopRatedMoviesEvent>(_getTopRatedMovies);

  }

  FutureOr<void> _getNowPlayingMovies(NowPlayingMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getNowPlaying(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
          nowPlayingMessage: l.message,
          nowPlayingState: RequestState.loaded)),
          (r) => emit(state.copyWith(
        nowPlayingState: RequestState.loaded,
        nowPlayingMovies: r,
      )),
    );
  }

  FutureOr<void> _getPopularMovies(PopularMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getPopularMovies(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
          popularMessage: l.message,
          popularState: RequestState.loaded)),
          (r) => emit(state.copyWith(
        popularState: RequestState.loaded,
        popularMovies: r,
      )),
    );
  }

  FutureOr<void> _getTopRatedMovies(TopRatedMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getTopRatedMovies(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
          topRatedMessage: l.message,
          topRatedState: RequestState.loaded)),
          (r) => emit(state.copyWith(
        topRatedState: RequestState.loaded,
        topRatedMovies: r,
      )),
    );
  }


}
