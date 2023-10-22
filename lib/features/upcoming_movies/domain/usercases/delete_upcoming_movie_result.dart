import 'dart:developer';

import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/core/usecases/usecase.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';
import 'package:movie_db/features/upcoming_movies/domain/repository/upcoming_movies_repository.dart';

class DeleteUpcomingMoviesUseCase implements UseCase<void, ResultsEntity> {
  final UpcomingMoviesRepository _moviesRepository;
  DeleteUpcomingMoviesUseCase(this._moviesRepository);
  @override
  Future<void> call({ResultsEntity? params}) {
    return _moviesRepository.delelteUpcomingMoviesLocal(params!);
  }
}
