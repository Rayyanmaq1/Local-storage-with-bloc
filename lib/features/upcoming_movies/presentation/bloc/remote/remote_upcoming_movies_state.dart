import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/upcoming_movies_entity.dart';
// part of 'remote_upcoming_movies_bloc.dart';

abstract class RemoteUpcomingMoviesState {
  final UpcomingMoviesEntity? upcomingMovies;
  final DioException? error;
  const RemoteUpcomingMoviesState({this.upcomingMovies, this.error});
}

class RemoteUpcomingMoviesLoading extends RemoteUpcomingMoviesState {
  const RemoteUpcomingMoviesLoading();
}

class RemoteUpcomingMoviesDone extends RemoteUpcomingMoviesState {
  const RemoteUpcomingMoviesDone(UpcomingMoviesEntity? upcomingMovies)
      : super(upcomingMovies: upcomingMovies);
}

class RemoteUpcomingMoviesError extends RemoteUpcomingMoviesState {
  const RemoteUpcomingMoviesError(DioException error) : super(error: error);
}
