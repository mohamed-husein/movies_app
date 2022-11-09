import 'package:equatable/equatable.dart';
import 'package:movies_app/tv/domain/entities/genres.dart';
import 'package:movies_app/tv/domain/entities/seasons.dart';

class TvDetails extends Equatable {
  final int id;
  final int runtime;
  final String backdropPath;
  final String name;
  final String overview;
  final double voteAverage;
  final String firstAirDate;
  final List<Genres> genres;
  final List<Season> season;

  const TvDetails({
    required this.id,
    required this.runtime,
    required this.backdropPath,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.firstAirDate,
    required this.genres,
    required this.season,
  });

  @override
  List<Object> get props =>
      [
        id,
        backdropPath,
        name,
        overview,
        runtime,
        voteAverage,
        firstAirDate,
        genres,
        season,
      ];
}
