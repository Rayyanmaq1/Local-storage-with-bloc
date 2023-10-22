import 'package:floor/floor.dart';
import 'package:movie_db/features/upcoming_movies/data/models/upcoming_movies_model.dart';

@dao
abstract class UpcomingMoviesResultsDao {
  @Insert()
  Future<void> insertData(Results results);

  @delete
  Future<void> deleteData(Results results);

  @Query('SELECT * FROM upcoming_movies_results')
  Future<List<Results>> getMoviesData();
}
