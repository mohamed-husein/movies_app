import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres_entities.dart';

class MoviesDetailsEntities extends Equatable {
  final int id;
  final String backdropPath;
  final String overView;
  final String releaseData;
  final int runtime;
  final String title;
  final double voteAverage;
  final List<GenresEntities> genres;

  const MoviesDetailsEntities({
    required this.id,
    required this.backdropPath,
    required this.overView,
    required this.releaseData,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        overView,
        releaseData,
        runtime,
        title,
        voteAverage,
        genres
      ];
}
