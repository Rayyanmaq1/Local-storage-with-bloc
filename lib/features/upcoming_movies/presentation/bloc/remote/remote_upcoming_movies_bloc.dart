import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';
import 'package:movie_db/features/upcoming_movies/domain/usercases/get_upcoming_movies.dart';
import 'package:movie_db/features/upcoming_movies/presentation/bloc/remote/remote_upcoming_movies_state.dart';

part 'remote_upcoming_movies_event.dart';

class RemoteUpcomingMoviesBloc
    extends Bloc<RemoteUpcomingMoviesEvent, RemoteUpcomingMoviesState> {
  final GetUpcomingMoviesUseCase _getUpComingMovies;
  RemoteUpcomingMoviesBloc(this._getUpComingMovies)
      : super(const RemoteUpcomingMoviesLoading()) {
    on<GetUpcomingMovies>(onGetUpComingMovies);
    on<LoadMoreUpcomingMovies>(loadMoreData);
  }
  int index = 1;
  UpcomingMoviesEntity upcomingMoviePage = UpcomingMoviesEntity();

  void onGetUpComingMovies(
      GetUpcomingMovies event, Emitter<RemoteUpcomingMoviesState> emit) async {
    final dataState = await _getUpComingMovies();
    if (dataState is DataSuccess && dataState.data!.results!.isNotEmpty) {
      upcomingMoviePage = dataState.data!;
      emit(RemoteUpcomingMoviesDone(dataState.data));
    }
    if (dataState is DataFailed) {
      emit(RemoteUpcomingMoviesError(dataState.error!));
    }
  }

  void loadMoreData(LoadMoreUpcomingMovies event,
      Emitter<RemoteUpcomingMoviesState> emit) async {
    // emit(const RemoteMoreUpcomingMoviesLoading());

    index++;

    final dataState = await _getUpComingMovies(pageIndex: index);
    if (dataState is DataSuccess && dataState.data!.results!.isNotEmpty) {
      upcomingMoviePage.page = dataState.data!.page;
      if (upcomingMoviePage.results != null) {
        state.upcomingMovies!.results!.addAll(dataState.data!.results!);
      }
      emit(RemoteUpcomingMoviesDone(state.upcomingMovies));
    }
    if (dataState is DataFailed) {
      emit(RemoteUpcomingMoviesError(dataState.error!));
    }
  }
}
