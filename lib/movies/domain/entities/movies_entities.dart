import 'package:equatable/equatable.dart';

class MoviesEntities extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final String posterPath;

  const MoviesEntities({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate
  });



  @override
  List<Object?> get props => [id,title,backdropPath,genreIds,overview,releaseDate,voteAverage,posterPath];
}
