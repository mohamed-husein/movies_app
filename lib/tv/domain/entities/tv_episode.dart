import 'package:equatable/equatable.dart';

class TvEpisodes extends Equatable {
  final int id;
  final String stillPath;
  final String name;
  final String overview;
  final String firstAirDate;

  const TvEpisodes({
    required this.id,
    required this.stillPath,
    required this.name,
    required this.overview,
    required this.firstAirDate,
  });

  @override
  List<Object> get props => [id, stillPath, name, overview, firstAirDate];
}
