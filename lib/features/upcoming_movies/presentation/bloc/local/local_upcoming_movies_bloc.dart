// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';
import 'package:movie_db/features/upcoming_movies/domain/usercases/delete_upcoming_movie_result.dart';
import 'package:movie_db/features/upcoming_movies/domain/usercases/get_save_upcoming_movie_result.dart';
import 'package:movie_db/features/upcoming_movies/domain/usercases/save_upcoming_movie_result.dart';
part 'local_upcoming_movies_event.dart';
part 'local_upcoming_movies_state.dart';

class LocalUpcomingMoviesBloc
    extends Bloc<LocalUpcomingMoviesEvent, LocalUpcomingMoviesState> {
  final GetSavedUpcomingMoviesUseCase _getUpComingMovies;
  final SavedUpcomingMoviesUseCase _saveUpcomingMovieResult;
  final DeleteUpcomingMoviesUseCase _removeUpcomingMovieResult;
  LocalUpcomingMoviesBloc(
    this._getUpComingMovies,
    this._saveUpcomingMovieResult,
    this._removeUpcomingMovieResult,
  ) : super(LocalUpcomingMoviesInitial()) {
    on<GetLocalUpcomingMovies>(onGetUpComingMovies);
    on<RemoveUpcomingMovies>(onRemoveMovie);
    on<SaveUpcomingMovies>(onSaveMovie);
  }

  void onGetUpComingMovies(GetLocalUpcomingMovies getUpcomingMovies,
      Emitter<LocalUpcomingMoviesState> emitter) async {
    final movies = await _getUpComingMovies();
    emit(LocalUpcomingMoviesDone(movies));
  }

  void onRemoveMovie(RemoveUpcomingMovies resultsEntity,
      Emitter<LocalUpcomingMoviesState> emitter) async {
    await _removeUpcomingMovieResult(params: resultsEntity.resultsEntity);
    final movies = await _getUpComingMovies();
    emit(LocalUpcomingMoviesDone(movies));
  }

  void onSaveMovie(SaveUpcomingMovies resultsEntity,
      Emitter<LocalUpcomingMoviesState> emitter) async {
    await _saveUpcomingMovieResult(params: resultsEntity.resultsEntity);
    final movies = await _getUpComingMovies();
    emit(LocalUpcomingMoviesDone(movies));
  }
}
