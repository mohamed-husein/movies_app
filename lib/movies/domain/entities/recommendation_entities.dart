import 'package:equatable/equatable.dart';

class RecommendationEntities extends Equatable{
  final int id;
  final String? backdropPath;

  const RecommendationEntities({required this.id,this.backdropPath});

  @override
  List<Object?> get props => [id,backdropPath];
}