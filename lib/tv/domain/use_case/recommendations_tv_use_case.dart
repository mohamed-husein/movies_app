import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/tv/domain/entities/tv_recommendations.dart';
import 'package:movies_app/tv/domain/repository/tv_repository.dart';

class GetRecommendationsTvShow extends BaseUseCase<List<TvRecommendations>,TvRecommendationsParameters>{

  final TvRepository tvRepository;

  GetRecommendationsTvShow({required this.tvRepository});
  @override
  Future<Either<Failure, List<TvRecommendations>>> call(TvRecommendationsParameters parameters)async {
   return await tvRepository.getRecommendationsTvShow(parameters);
  }
}


class TvRecommendationsParameters extends Equatable {
  final int tvId;

  const TvRecommendationsParameters({required this.tvId});

  @override
  List<Object> get props => [tvId];
}