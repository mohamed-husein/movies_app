class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'b10a9908fcb56fe5120e516026d96c28';

  /// Movies Apis
  static const String nowPlayingPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String moviesId(int moviesId) =>
      '$baseUrl/movie/$moviesId?api_key=$apiKey';

  static String recommendation(int moviesId) =>
      '$baseUrl/movie/$moviesId/recommendations?api_key=$apiKey';

  static String videoPath(int moviesId) =>
      '$baseUrl/movie/$moviesId/videos?api_key=$apiKey';

  /// TV Apis
  static const String onTheAirTvPath = '$baseUrl/tv/on_the_air?api_key=$apiKey';
  static const String popularTvPath = '$baseUrl/tv/popular?api_key=$apiKey';
  static const String theTopRatedTvPath =
      '$baseUrl/tv/top_rated?api_key=$apiKey';

  static String tvDetails(int tvId) => '$baseUrl/tv/$tvId?api_key=$apiKey';

  static String tvRecommendation(int tvId) =>
      '$baseUrl/tv/$tvId/recommendations?api_key=$apiKey';

  static String tvVideos(int tvId) =>
      '$baseUrl/tv/$tvId/videos?api_key=$apiKey';

  static String tvEpisode(int tvId, int episodeNum) =>
      '$baseUrl/tv/$tvId/season/$episodeNum?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) {
    return '$baseImageUrl$path';
  }
}
