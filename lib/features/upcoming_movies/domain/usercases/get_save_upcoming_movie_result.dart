import 'dart:developer';

import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/core/usecases/usecase.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';
import 'package:movie_db/features/upcoming_movies/domain/repository/upcoming_movies_repository.dart';

class GetSavedUpcomingMoviesUseCase
    implements UseCase<List<ResultsEntity>, void> {
  final UpcomingMoviesRepository _moviesRepository;
  GetSavedUpcomingMoviesUseCase(this._moviesRepository);
  @override
  Future<List<ResultsEntity>> call({void params}) {
    return _moviesRepository.getUpcomingMoviesLocal();
  }
}
