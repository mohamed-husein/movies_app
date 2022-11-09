import 'package:movies_app/tv/domain/entities/tv_show.dart';

class TvShowModel extends TvShow {
  const TvShowModel({
    required super.id,
    required super.posterPath,
    required super.name,
    required super.overview,
    required super.voteAverage,
    required super.firstAirDate,
    required super.backdropPath,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? "https://image.tmdb.org/t/p/w500/qG59J1Q7rpBc1dvku4azbzcqo8h.jpg",
      posterPath: json['poster_path'],
      name: json['name'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      firstAirDate: json['first_air_date'],
    );
  }
}
