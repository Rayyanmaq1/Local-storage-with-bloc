import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movie_db/features/custom_navigation/presentation/bloc/custom_navigation_bloc.dart';
import 'package:movie_db/features/movie_detail/data/data_source/remote/movie_detail_service.dart';
import 'package:movie_db/features/movie_detail/data/repository/movie_detail_repository_impl.dart';
import 'package:movie_db/features/movie_detail/domain/repostory/movie_detail_repository.dart';
import 'package:movie_db/features/movie_detail/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_db/features/movie_detail/presentaion/bloc/bloc/movie_detail_bloc.dart';
import 'package:movie_db/features/upcoming_movies/data/data_source/locale/app_database/app_database.dart';
import 'package:movie_db/features/upcoming_movies/data/data_source/remote/upcoming_movies_service.dart';
import 'package:movie_db/features/upcoming_movies/data/repository/upcoming_movies_repository_impl.dart';
import 'package:movie_db/features/upcoming_movies/domain/repository/upcoming_movies_repository.dart';
import 'package:movie_db/features/upcoming_movies/domain/usercases/delete_upcoming_movie_result.dart';
import 'package:movie_db/features/upcoming_movies/domain/usercases/get_save_upcoming_movie_result.dart';
import 'package:movie_db/features/upcoming_movies/domain/usercases/get_upcoming_movies.dart';
import 'package:movie_db/features/upcoming_movies/domain/usercases/save_upcoming_movie_result.dart';
import 'package:movie_db/features/upcoming_movies/presentation/bloc/local/local_upcoming_movies_bloc.dart';
import 'package:movie_db/features/upcoming_movies/presentation/bloc/remote/remote_upcoming_movies_bloc.dart';

final sl = GetIt.instance;

Future<void> intializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());
// dependencies
  sl.registerSingleton<UpcomingMoviesService>(UpcomingMoviesService(sl()));
  sl.registerSingleton<UpcomingMoviesRepository>(
      UpcomingMoviesRepositoryImpl(sl(), sl()));

  sl.registerSingleton<MovieDetailService>(MovieDetailService(sl()));
  sl.registerSingleton<MovieDetailRepository>(GetMovieDetailReposityImpl(sl()));
// userCases
  sl.registerSingleton<GetUpcomingMoviesUseCase>(
      GetUpcomingMoviesUseCase(sl()));
  sl.registerSingleton<GetMovieDetailUseCase>(GetMovieDetailUseCase(sl()));
  sl.registerSingleton<GetSavedUpcomingMoviesUseCase>(
      GetSavedUpcomingMoviesUseCase(sl()));
  sl.registerSingleton<SavedUpcomingMoviesUseCase>(
      SavedUpcomingMoviesUseCase(sl()));
  sl.registerSingleton<DeleteUpcomingMoviesUseCase>(
      DeleteUpcomingMoviesUseCase(sl()));

  //bloc
  sl.registerFactory<CustomNavigationBloc>(
    () => CustomNavigationBloc(sl()),
  );
  sl.registerFactory<RemoteUpcomingMoviesBloc>(
    () => RemoteUpcomingMoviesBloc(sl()),
  );
  sl.registerFactory<LocalUpcomingMoviesBloc>(
    () => LocalUpcomingMoviesBloc(sl(), sl(), sl()),
  );
}
