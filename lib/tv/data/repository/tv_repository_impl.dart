import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/tv/data/data_source/tv_remote_datasource.dart';
import 'package:movies_app/tv/domain/entities/tv_details.dart';
import 'package:movies_app/tv/domain/entities/tv_episode.dart';
import 'package:movies_app/tv/domain/entities/tv_recommendations.dart';
import 'package:movies_app/tv/domain/entities/tv_show.dart';
import 'package:movies_app/tv/domain/entities/tv_videos.dart';
import 'package:movies_app/tv/domain/repository/tv_repository.dart';
import 'package:movies_app/tv/domain/use_case/episode_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/recommendations_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/tv_details_use_case.dart';
import 'package:movies_app/tv/domain/use_case/videos_tv_use_case.dart';

class TvRepositoryImpl implements TvRepository {
  final TvRemoteDataSource tvRemoteDataSource;

  TvRepositoryImpl({required this.tvRemoteDataSource});

  @override
  Future<Either<Failure, TvDetails>> getDetailsTvShow(
      TvDetailsParameters parameters) async {
    final result = await tvRemoteDataSource.getDetailsTvShow(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEpisodes>>> getEpisodesTvShow(
      TvEpisodesParameters parameters) async {
    final result = await tvRemoteDataSource.getEpisodesTvShow(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getOnTheAirTvShow() async {
    final result = await tvRemoteDataSource.getOnTheAitTvShow();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShow() async {
    final result = await tvRemoteDataSource.getPopularTvShow();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendations>>> getRecommendationsTvShow(
      TvRecommendationsParameters parameters) async {
    final result =
        await tvRemoteDataSource.getRecommendationsTvShow(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getToRatedTvShow() async {
    final result = await tvRemoteDataSource.getToRatedTvShow();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Videos>>> getVideosTvShow(
      VideosParameters parameters) async {
    final result = await tvRemoteDataSource.getVideosTvShow(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
