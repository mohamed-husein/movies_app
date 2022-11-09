import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/tv/domain/entities/tv_episode.dart';
import 'package:movies_app/tv/domain/repository/tv_repository.dart';

class GetEpisodesTvShow extends BaseUseCase<List<TvEpisodes>,TvEpisodesParameters>{
  final TvRepository tvRepository;

  GetEpisodesTvShow({required this.tvRepository});

  @override
  Future<Either<Failure, List<TvEpisodes>>> call(TvEpisodesParameters parameters)async {
   return await tvRepository.getEpisodesTvShow(parameters);
  }
}

class TvEpisodesParameters extends Equatable {
  final int tvId;
  final int seasonNum;

  const TvEpisodesParameters( {required this.tvId,required this.seasonNum,});

  @override
  List<Object> get props => [tvId];
}