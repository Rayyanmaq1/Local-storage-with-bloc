import 'package:floor/floor.dart';
import 'package:movie_db/features/upcoming_movies/data/data_source/locale/DAO/upcoming_movie_result_dao.dart';
import 'package:movie_db/features/upcoming_movies/data/models/upcoming_movies_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [Results])
abstract class AppDatabase extends FloorDatabase {
  UpcomingMoviesResultsDao get moviesResultsDao;
}
