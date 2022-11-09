import 'package:equatable/equatable.dart';

class TvShow extends Equatable {
  final int id;
  final String posterPath;
  final String backdropPath;
  final String name;
  final String overview;
  final double voteAverage;
  final String firstAirDate;

  const TvShow(
      {required this.id,
      required this.posterPath,
      required this.backdropPath,
      required this.name,
      required this.overview,
      required this.voteAverage,
      required this.firstAirDate});

  @override
  List<Object> get props => [
        id,
        posterPath,
    backdropPath,
        name,
        overview,
        voteAverage,
        firstAirDate,
      ];
}
