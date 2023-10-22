part of 'remote_upcoming_movies_bloc.dart';

abstract class RemoteUpcomingMoviesEvent {
  const RemoteUpcomingMoviesEvent();
}

class GetUpcomingMovies extends RemoteUpcomingMoviesEvent {
  const GetUpcomingMovies();
}

class LoadMoreUpcomingMovies extends RemoteUpcomingMoviesEvent {
  const LoadMoreUpcomingMovies();
}
