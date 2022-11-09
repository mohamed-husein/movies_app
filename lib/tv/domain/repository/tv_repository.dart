import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/tv/domain/entities/tv_details.dart';
import 'package:movies_app/tv/domain/entities/tv_episode.dart';
import 'package:movies_app/tv/domain/entities/tv_recommendations.dart';
import 'package:movies_app/tv/domain/entities/tv_show.dart';
import 'package:movies_app/tv/domain/entities/tv_videos.dart';
import 'package:movies_app/tv/domain/use_case/episode_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/recommendations_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/tv_details_use_case.dart';
import 'package:movies_app/tv/domain/use_case/videos_tv_use_case.dart';

abstract class TvRepository{
  Future<Either<Failure, List<TvShow>>> getOnTheAirTvShow();
  Future<Either<Failure, List<TvShow>>>  getPopularTvShow();
  Future<Either<Failure, List<TvShow>>> getToRatedTvShow();
  Future<Either<Failure, TvDetails>> getDetailsTvShow(TvDetailsParameters parameters);
  Future<Either<Failure, List<TvRecommendations>>> getRecommendationsTvShow(TvRecommendationsParameters parameters);
  Future<Either<Failure, List<Videos>>> getVideosTvShow(VideosParameters parameters);
  Future<Either<Failure, List<TvEpisodes>>> getEpisodesTvShow(TvEpisodesParameters parameters);
}