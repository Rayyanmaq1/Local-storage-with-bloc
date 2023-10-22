import 'dart:developer';

import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/core/usecases/usecase.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';
import 'package:movie_db/features/upcoming_movies/domain/repository/upcoming_movies_repository.dart';

class GetUpcomingMoviesUseCase
    implements UseCase<DataState<UpcomingMoviesEntity>, void> {
  final UpcomingMoviesRepository _moviesRepository;
  GetUpcomingMoviesUseCase(this._moviesRepository);
  @override
  Future<DataState<UpcomingMoviesEntity>> call({void params, pageIndex}) {
    return _moviesRepository.getUpcomingMovies(pageIndex);
  }
}
