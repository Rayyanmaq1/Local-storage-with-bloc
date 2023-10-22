import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_videos_entity.dart';

abstract class MovieDetailEvent {
  const MovieDetailEvent();
}

class RemoteGetMovieDetailEvent extends MovieDetailEvent {
  const RemoteGetMovieDetailEvent({this.movieID});
  final int? movieID;
}

// class GetVideoIdsEvent extends MovieDetailEvent {
//   final MovieDetailVideoEntity videoEntity;
//   const GetVideoIdsEvent({required this.videoEntity});
// }
