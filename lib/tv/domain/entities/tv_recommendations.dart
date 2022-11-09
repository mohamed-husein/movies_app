import 'package:equatable/equatable.dart';

class TvRecommendations extends Equatable{
  final int id;
  final String? posterPath;

  const TvRecommendations({required this.id, this.posterPath});

  @override
  List<Object?> get props => [id, posterPath];
}