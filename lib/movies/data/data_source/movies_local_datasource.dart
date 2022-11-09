import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/movies/data/model/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MoviesLocalDatasource
{
   Future<Unit> cacheMovies(List<MoviesModel> moviesModel);
   Future<List<MoviesModel>> getCached();
}
class MoviesLocalDatasourceImpl extends MoviesLocalDatasource{
  final SharedPreferences sharedPreferences;

  MoviesLocalDatasourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheMovies(List<MoviesModel> moviesModel) {
    List moviesModelToJson = moviesModel.map<Map<String, dynamic>>((movieModel) => movieModel.toJson()).toList();
     sharedPreferences.setString(AppStrings.cacheMoviesKey, json.encode(moviesModelToJson));
    return Future.value(unit);

  }

  @override
  Future<List<MoviesModel>> getCached() {
    final stringJson = sharedPreferences.getString(AppStrings.cacheMoviesKey);
    if(stringJson != null)
    {
      List decodeJsonData = json.decode(stringJson);
      List<MoviesModel> jsonToMoviesModel = decodeJsonData.map<MoviesModel>((jsonMoviesModel) => MoviesModel.fromJson(jsonMoviesModel)).toList();
      return Future.value(jsonToMoviesModel);
    }
    else
    {
      throw EmptyCacheException();
    }
  }
}