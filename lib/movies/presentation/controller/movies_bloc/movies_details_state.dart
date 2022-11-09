part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetailsEntities moviesDetailsState;
  final RequestState moviesState;
  final String moviesMessage;


  final List<VideosEntities> youtubeMovies;
  final RequestState youtubeState;
  final String youtubeMessage;

  final List<RecommendationEntities> recommendationMovies;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MoviesDetailsState({
    this.moviesDetailsState = const MoviesDetailsEntities(
      backdropPath: '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
      genres: [
        GenresEntities(name: 'Family', id: 10751),
      ],
      id: 438148,
      overView:
      "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
      releaseData: "2022-06-29",
      runtime: 87,
      title: "Minions: The Rise of Gru",
      voteAverage: 7.8,
    ),
    this.moviesState = RequestState.loading,
    this.moviesMessage = '',
    this.recommendationMovies = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
    this.youtubeMovies = const [],
    this.youtubeState = RequestState.loading,
    this.youtubeMessage = '',

  });

  MoviesDetailsState copyWith({
    MoviesDetailsEntities? moviesDetailsState,
    RequestState? moviesState,
    String? moviesMessage,
    List<RecommendationEntities>? recommendationMovies,
    RequestState? recommendationState,
    String? recommendationMessage,
    List<VideosEntities>? youtubeMovies,
    RequestState? youtubeState,
    String? youtubeMessage,

  }) {
    return MoviesDetailsState(

      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      moviesState: moviesState ?? this.moviesState,
      moviesMessage: moviesMessage ?? this.moviesMessage,
      recommendationMovies: recommendationMovies ?? this.recommendationMovies,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
      recommendationMessage ?? this.recommendationMessage,
      youtubeMovies: youtubeMovies ?? this.youtubeMovies,
      youtubeState: youtubeState ?? this.youtubeState,
      youtubeMessage: youtubeMessage ?? this.youtubeMessage,


    );
  }

  @override
  List<Object?> get props =>
      [
        moviesDetailsState,
        moviesState,
        moviesMessage,
        recommendationMovies,
        recommendationState,
        recommendationMessage,
        youtubeMessage,
        youtubeState,
        youtubeMovies,
      ];
}
