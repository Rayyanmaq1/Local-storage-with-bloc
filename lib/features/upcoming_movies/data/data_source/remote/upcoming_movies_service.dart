import 'package:movie_db/core/constants/constants.dart';
import 'package:movie_db/features/upcoming_movies/data/models/upcoming_movies_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'upcoming_movies_service.g.dart';

@RestApi(baseUrl: movieDBBaseUrl)
abstract class UpcomingMoviesService {
  factory UpcomingMoviesService(Dio dio) = _UpcomingMoviesService;

  @GET('/3/movie/upcoming')
  Future<HttpResponse<UpcomingMoviesModel>> getUpcomingMovies({
    @Query('api_key') String? apiKey,
    @Query("language") String? language,
    @Query("page") int? page,
  });
}
