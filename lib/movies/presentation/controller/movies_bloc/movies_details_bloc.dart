import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/genres_entities.dart';
import 'package:movies_app/movies/domain/entities/movies_details_entities.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entities.dart';
import 'package:movies_app/movies/domain/entities/video_entities.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_movies.dart';
import 'package:movies_app/movies/domain/use_case/get_youtube_video.dart';

part 'movies_details_event.dart';

part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(
      this.getMoviesDetails, this.getRecommendationMovies, this.getYoutubeVideo)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMoviesDetails);
    on<GetMoviesRecommendationEvent>(_getMoviesRecommendation);
    on<GetYoutubeVideoEvent>(_getYoutube);
  }

  final GetMoviesDetails getMoviesDetails;
  final GetRecommendationMovies getRecommendationMovies;
  final GetYoutubeVideo getYoutubeVideo;


  FutureOr<void> _getMoviesDetails(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result = await getMoviesDetails(
        MoviesDetailsParameters(moviesId: event.moviesId));
    result.fold(
      (l) => emit(state.copyWith(
          moviesMessage: l.message, moviesState: RequestState.loaded)),
      (r) => emit(state.copyWith(
        moviesState: RequestState.loaded,
        moviesDetailsState: r,
      )),
    );
  }

  FutureOr<void> _getMoviesRecommendation(GetMoviesRecommendationEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result = await getRecommendationMovies(
        RecommendationParameters(moviesId: event.moviesId));
    result.fold(
      (l) => emit(state.copyWith(
          recommendationMessage: l.message,
          recommendationState: RequestState.loaded)),
      (r) => emit(state.copyWith(
        recommendationState: RequestState.loaded,
        recommendationMovies: r,
      )),
    );
  }

  FutureOr<void> _getYoutube(
      GetYoutubeVideoEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getYoutubeVideo(YoutubeVideoParameters(moviesId: event.moviesId));
    result.fold(
      (l) => emit(state.copyWith(
          youtubeMessage: l.message, youtubeState: RequestState.loaded)),
      (r) => emit(state.copyWith(
        youtubeState: RequestState.loaded,
        youtubeMovies: r,
      )),
    );
  }
}
