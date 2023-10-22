import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/core/usecases/usecase.dart';
import 'package:movie_db/features/movie_detail/domain/repostory/movie_detail_repository.dart';

class GetMovieDetailUseCase implements UseCase<List<DataState<Object>>, void> {
  final MovieDetailRepository _moviesRepository;
  GetMovieDetailUseCase(this._moviesRepository);
  @override
  Future<List<DataState<Object>>> call({void params, movieID}) {
    return Future.wait([
      _moviesRepository.getMovieDetail(movieID),
      _moviesRepository.getMovieDetailImages(movieID),
      _moviesRepository.getMovieDetailVideos(movieID),
    ]);
  }
}
