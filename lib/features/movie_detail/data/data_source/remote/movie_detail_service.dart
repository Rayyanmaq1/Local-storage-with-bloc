import 'package:movie_db/core/constants/constants.dart';
import 'package:movie_db/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:movie_db/features/movie_detail/data/models/movie_images_model.dart';
import 'package:movie_db/features/movie_detail/data/models/movie_video_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movie_detail_service.g.dart';

@RestApi(baseUrl: movieDBBaseUrl)
abstract class MovieDetailService {
  factory MovieDetailService(Dio dio) = _MovieDetailService;

  @GET("/3/movie/{movie_id}")
  Future<HttpResponse<MovieDetailModel>> getMovieDetail({
    @Query('api_key') String? apiKey,
    @Path("movie_id") int? movieId,
  });

  @GET("/3/movie/{movie_id}/images")
  Future<HttpResponse<MovieDetailImagesModel>> getMovieDetailImages({
    @Query('api_key') String? apiKey,
    @Path("movie_id") int? movieId,
  });
  @GET("/3/movie/{movie_id}/videos")
  Future<HttpResponse<MovieDetailVideoModel>> getMovieDetailVideos({
    @Query('api_key') String? apiKey,
    @Path("movie_id") int? movieId,
  });
}
