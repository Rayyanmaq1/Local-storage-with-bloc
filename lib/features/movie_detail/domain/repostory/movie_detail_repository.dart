import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_images_entity.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_videos_entity.dart';

abstract class MovieDetailRepository {
  Future<DataState<MovieDetailEntity>> getMovieDetail(movieIndex);
  Future<DataState<MovieDetailImageEntity>> getMovieDetailImages(movieIndex);
  Future<DataState<MovieDetailVideoEntity>> getMovieDetailVideos(movieIndex);
}
