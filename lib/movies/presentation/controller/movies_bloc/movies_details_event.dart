part of 'movies_details_bloc.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();
}

class GetMoviesDetailsEvent extends MoviesDetailsEvent{
  final int moviesId;

  const GetMoviesDetailsEvent(this.moviesId);
  @override
  List<Object?> get props => [moviesId];
}


class GetMoviesRecommendationEvent extends MoviesDetailsEvent{
  final int moviesId;

  const GetMoviesRecommendationEvent(this.moviesId);
  @override
  List<Object?> get props => [moviesId];
}
class GetYoutubeVideoEvent extends MoviesDetailsEvent{
  final int moviesId;

  const GetYoutubeVideoEvent(this.moviesId);
  @override
  List<Object?> get props => [moviesId];
}
