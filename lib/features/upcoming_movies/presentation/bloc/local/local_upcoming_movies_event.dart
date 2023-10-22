part of 'local_upcoming_movies_bloc.dart';

abstract class LocalUpcomingMoviesEvent {
  final ResultsEntity? resultsEntity;
  const LocalUpcomingMoviesEvent({this.resultsEntity});
}

class GetLocalUpcomingMovies extends LocalUpcomingMoviesEvent {
  const GetLocalUpcomingMovies();
}

class RemoveUpcomingMovies extends LocalUpcomingMoviesEvent {
  const RemoveUpcomingMovies(ResultsEntity resultsEntity)
      : super(resultsEntity: resultsEntity);
}

class SaveUpcomingMovies extends LocalUpcomingMoviesEvent {
  const SaveUpcomingMovies(ResultsEntity resultsEntity)
      : super(resultsEntity: resultsEntity);
}
