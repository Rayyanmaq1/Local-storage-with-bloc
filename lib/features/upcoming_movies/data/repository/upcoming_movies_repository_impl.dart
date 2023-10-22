import 'dart:io';

import 'package:movie_db/core/constants/constants.dart';
import 'package:movie_db/core/resources/data_state.dart';
// import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_videos_entity.dart';
import 'package:movie_db/features/upcoming_movies/data/data_source/locale/app_database/app_database.dart';
import 'package:movie_db/features/upcoming_movies/data/data_source/remote/upcoming_movies_service.dart';
import 'package:movie_db/features/upcoming_movies/data/models/upcoming_movies_model.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';
import 'package:movie_db/features/upcoming_movies/domain/repository/upcoming_movies_repository.dart';
import 'package:dio/dio.dart';

class UpcomingMoviesRepositoryImpl implements UpcomingMoviesRepository {
  final UpcomingMoviesService _upcomingMoviesService;
  final AppDatabase _appDatabase;
  UpcomingMoviesRepositoryImpl(this._upcomingMoviesService, this._appDatabase);
  @override
  Future<DataState<UpcomingMoviesModel>> getUpcomingMovies(pageIndex) async {
    try {
      final httpResponce = await _upcomingMoviesService.getUpcomingMovies(
        apiKey: apiKey,
        language: language,
        page: pageIndex,
      );
      if (httpResponce.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponce.data);
      } else {
        return DataFailed(DioException(
          requestOptions: httpResponce.response.requestOptions,
          response: httpResponce.response,
          error: httpResponce.response.statusCode,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> delelteUpcomingMoviesLocal(ResultsEntity results) {
    return _appDatabase.moviesResultsDao
        .deleteData(Results.fromEntity(results));
  }

  @override
  Future<List<Results>> getUpcomingMoviesLocal() {
    return _appDatabase.moviesResultsDao.getMoviesData();
  }

  @override
  Future<void> saveUpcomingMoviesLocal(ResultsEntity results) {
    return _appDatabase.moviesResultsDao
        .insertData(Results.fromEntity(results));
  }
}
