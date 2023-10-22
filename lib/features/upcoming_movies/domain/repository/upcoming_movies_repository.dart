import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/upcoming_movies/data/models/upcoming_movies_model.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';

abstract class UpcomingMoviesRepository {
  Future<DataState<UpcomingMoviesEntity>> getUpcomingMovies(pageIndex);

  Future<List<Results>> getUpcomingMoviesLocal();
  Future<void> saveUpcomingMoviesLocal(ResultsEntity results);
  Future<void> delelteUpcomingMoviesLocal(ResultsEntity results);
}
