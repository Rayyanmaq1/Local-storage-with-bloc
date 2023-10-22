import 'dart:io';

import 'package:movie_db/core/constants/constants.dart';
import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/movie_detail/data/data_source/remote/movie_detail_service.dart';
import 'package:movie_db/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:movie_db/features/movie_detail/data/models/movie_images_model.dart';
import 'package:movie_db/features/movie_detail/data/models/movie_video_model.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';
import 'package:movie_db/features/movie_detail/domain/repostory/movie_detail_repository.dart';
import 'package:dio/dio.dart';

class GetMovieDetailReposityImpl implements MovieDetailRepository {
  final MovieDetailService _movieDetailService;
  GetMovieDetailReposityImpl(this._movieDetailService);
  @override
  Future<DataState<MovieDetailModel>> getMovieDetail(movieID) async {
    try {
      final httpResponce = await _movieDetailService.getMovieDetail(
        apiKey: apiKey,
        movieId: movieID,
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
  Future<DataState<MovieDetailImagesModel>> getMovieDetailImages(
      movieID) async {
    try {
      final httpResponce = await _movieDetailService.getMovieDetailImages(
        apiKey: apiKey,
        movieId: movieID,
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
  Future<DataState<MovieDetailVideoModel>> getMovieDetailVideos(movieID) async {
    try {
      final httpResponce = await _movieDetailService.getMovieDetailVideos(
        apiKey: apiKey,
        movieId: movieID,
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
}
