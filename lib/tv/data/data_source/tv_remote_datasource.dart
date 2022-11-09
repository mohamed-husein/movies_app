import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/api_constants.dart';
import 'package:movies_app/tv/data/model/tv_details_model.dart';
import 'package:movies_app/tv/data/model/tv_episode_model.dart';
import 'package:movies_app/tv/data/model/tv_recommendations_model.dart';
import 'package:movies_app/tv/data/model/tv_show_model.dart';
import 'package:movies_app/tv/data/model/tv_videos_model.dart';
import 'package:movies_app/tv/domain/use_case/episode_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/recommendations_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/tv_details_use_case.dart';
import 'package:movies_app/tv/domain/use_case/videos_tv_use_case.dart';

abstract class TvRemoteDataSource {
  Future<List<TvShowModel>> getOnTheAitTvShow();

  Future<List<TvShowModel>> getPopularTvShow();

  Future<List<TvShowModel>> getToRatedTvShow();

  Future<TvDetailsModel> getDetailsTvShow(TvDetailsParameters parameters);

  Future<List<TvRecommendationsModel>> getRecommendationsTvShow(
      TvRecommendationsParameters parameters);

  Future<List<TvVideosModel>> getVideosTvShow(VideosParameters parameters);

  Future<List<TvEpisodeModel>> getEpisodesTvShow(
      TvEpisodesParameters parameters);
}

class TvRemoteDataSourceImpl extends TvRemoteDataSource {
  @override
  Future<TvDetailsModel> getDetailsTvShow(
      TvDetailsParameters parameters) async {
    final response = await Dio().get(ApiConstants.tvDetails(parameters.tvId));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvEpisodeModel>> getEpisodesTvShow(TvEpisodesParameters parameters) async {
    final response = await Dio()
        .get(ApiConstants.tvEpisode(parameters.tvId, parameters.seasonNum));
    if (response.statusCode == 200) {
      return List<TvEpisodeModel>.from(
        (response.data['episodes'] as List).map(
          (e) => TvEpisodeModel.fromJson(e),
        ),
      );
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvShowModel>> getOnTheAitTvShow()async {
    final response = await Dio()
        .get(ApiConstants.onTheAirTvPath);
    if (response.statusCode == 200) {
      return List<TvShowModel>.from(
        (response.data['results'] as List).map(
              (e) => TvShowModel.fromJson(e),
        ),
      );
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvShowModel>> getPopularTvShow()async {
    final response = await Dio()
        .get(ApiConstants.popularTvPath);
    if (response.statusCode == 200) {
      return List<TvShowModel>.from(
        (response.data['results'] as List).map(
              (e) => TvShowModel.fromJson(e),
        ),
      );
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvRecommendationsModel>> getRecommendationsTvShow(
      TvRecommendationsParameters parameters)async {
    final response = await Dio()
        .get(ApiConstants.tvRecommendation(parameters.tvId));
    if (response.statusCode == 200) {
      return List<TvRecommendationsModel>.from(
        (response.data['results'] as List).map(
              (e) => TvRecommendationsModel.fromJson(e),
        ),
      );
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvShowModel>> getToRatedTvShow() async{
    final response = await Dio()
        .get(ApiConstants.theTopRatedTvPath);
    if (response.statusCode == 200) {
      return List<TvShowModel>.from(
        (response.data['results'] as List).map(
              (e) => TvShowModel.fromJson(e),
        ),
      );
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvVideosModel>> getVideosTvShow(VideosParameters parameters)async {
    final response = await Dio()
        .get(ApiConstants.tvVideos(parameters.tvId));
    if (response.statusCode == 200) {
      return List<TvVideosModel>.from(
        (response.data['results'] as List).map(
              (e) => TvVideosModel.fromJson(e),
        ),
      );
    }
    else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
