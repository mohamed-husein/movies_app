part of 'tv_details_bloc.dart';


class TvDetailsState extends Equatable {
  final TvDetails tvDetails;
  final RequestState tvDetailsState;
  final String tvDetailsMessage;

  final List<TvRecommendations> tvRecommendations;
  final RequestState tvRecommendationsState;
  final String tvRecommendationsMessage;

  final List<Videos> tvVideos;
  final RequestState tvVideosState;
  final String tvVideosMessage;

  final List<TvEpisodes> tvEpisodes;
  final RequestState tvEpisodesState;
  final String tvEpisodesMessage;
  final String value;


  const TvDetailsState({
    this.tvDetails = const TvDetails(
        id: 0,
        backdropPath: '',
        name: '',
        overview: '',
        voteAverage: 0,
        firstAirDate: '',
        genres: [],
        season: [],
      runtime: 0,
    ),
    this.tvDetailsState = RequestState.loading,
    this.tvDetailsMessage = '',
    this.value ='',
    this.tvRecommendations = const[],
    this.tvRecommendationsState = RequestState.loading,
    this.tvRecommendationsMessage = '',
    this.tvVideos = const[],
    this.tvVideosState = RequestState.loading,
    this.tvVideosMessage = '',
    this.tvEpisodes = const[],
    this.tvEpisodesState = RequestState.loading,
    this.tvEpisodesMessage = '',});

  TvDetailsState copyWith({
    TvDetails? tvDetails,
    RequestState? tvDetailsState,
    String? tvDetailsMessage,

    List<TvRecommendations>? tvRecommendations,
    RequestState? tvRecommendationsState,
    String? tvRecommendationsMessage,

    List<Videos>? tvVideos,
    RequestState? tvVideosState,
    String? tvVideosMessage,

    List<TvEpisodes>? tvEpisodes,
    RequestState? tvEpisodesState,
    String? tvEpisodesMessage,

    String? value,
  }) {
    return TvDetailsState(
      tvDetails: tvDetails ?? this.tvDetails,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,

      tvRecommendations: tvRecommendations ?? this.tvRecommendations,
      tvRecommendationsState: tvRecommendationsState ??
          this.tvRecommendationsState,
      tvRecommendationsMessage: tvRecommendationsMessage ??
          this.tvRecommendationsMessage,

      tvVideos: tvVideos ?? this.tvVideos,
      tvVideosState: tvVideosState ?? this.tvVideosState,
      tvVideosMessage: tvVideosMessage ?? this.tvVideosMessage,

      tvEpisodes: tvEpisodes ?? this.tvEpisodes,
      tvEpisodesState: tvEpisodesState ?? this.tvEpisodesState,
      tvEpisodesMessage: tvEpisodesMessage ?? this.tvEpisodesMessage,

      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props =>
      [
        tvDetails,
        tvDetailsState,
        tvDetailsMessage,
        tvRecommendations,
        tvRecommendationsState,
        tvRecommendationsMessage,
        tvVideos,
        tvVideosState,
        tvVideosMessage,
        value,
        tvEpisodes,
        tvEpisodesState,
        tvEpisodesMessage,
      ];
}

class ChangeCurrentValue extends TvDetailsState{}
