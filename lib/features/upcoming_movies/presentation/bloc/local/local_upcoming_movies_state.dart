part of 'local_upcoming_movies_bloc.dart';

abstract class LocalUpcomingMoviesState {
  final List<ResultsEntity>? resultsEntity;
  LocalUpcomingMoviesState({this.resultsEntity});
}

class LocalUpcomingMoviesInitial extends LocalUpcomingMoviesState {}

class LocalUpcomingMoviesDone extends LocalUpcomingMoviesState {
  LocalUpcomingMoviesDone(List<ResultsEntity>? resultsEntity)
      : super(resultsEntity: resultsEntity);
}
