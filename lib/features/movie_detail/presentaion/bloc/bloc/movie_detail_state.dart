import 'package:dio/dio.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_images_entity.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_videos_entity.dart';

abstract class RemoteGetMovieDetailState {
  final MovieDetailEntity? movieDetail;
  final MovieDetailImageEntity? imageDetail;
  final MovieDetailVideoEntity? videoDetail;
  final DioException? error;
  final List<String>? videoIds;
  const RemoteGetMovieDetailState({
    this.videoIds,
    this.movieDetail,
    this.error,
    this.imageDetail,
    this.videoDetail,
  });
}

class RemoteMovieDetailLoading extends RemoteGetMovieDetailState {
  const RemoteMovieDetailLoading();
}

class RemoteMovieDetailDone extends RemoteGetMovieDetailState {
  const RemoteMovieDetailDone(
      {MovieDetailEntity? movieDetail,
      MovieDetailImageEntity? imagesDetail,
      MovieDetailVideoEntity? videoDetail,
      List<String>? videoIds})
      : super(
            movieDetail: movieDetail,
            imageDetail: imagesDetail,
            videoDetail: videoDetail,
            videoIds: videoIds);
}

class RemoteMovieDetailError extends RemoteGetMovieDetailState {
  const RemoteMovieDetailError(DioException error) : super(error: error);
}
