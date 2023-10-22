import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_images_entity.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_videos_entity.dart';
import 'package:movie_db/features/movie_detail/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_db/features/movie_detail/presentaion/bloc/bloc/movie_detail_event.dart';
import 'package:movie_db/features/movie_detail/presentaion/bloc/bloc/movie_detail_state.dart';
import 'package:dio/dio.dart';

class RemoteMovieDetailBloc
    extends Bloc<MovieDetailEvent, RemoteGetMovieDetailState> {
  final GetMovieDetailUseCase _getMovieDetailUseCase;
  RemoteMovieDetailBloc(this._getMovieDetailUseCase)
      : super(const RemoteMovieDetailLoading()) {
    on<RemoteGetMovieDetailEvent>(onGetMovieDetail);
    // on<GetVideoIdsEvent>(getVideoIds);
  }

  void onGetMovieDetail(RemoteGetMovieDetailEvent event,
      Emitter<RemoteGetMovieDetailState> emit) async {
    emit(const RemoteMovieDetailLoading());
    final dataState = await _getMovieDetailUseCase(movieID: event.movieID);

    if (dataState[0] is DataSuccess &&
        dataState[1] is DataSuccess &&
        dataState[2] is DataSuccess) {
      emit(
        RemoteMovieDetailDone(
          movieDetail: dataState[0].data as MovieDetailEntity,
          imagesDetail: dataState[1].data as MovieDetailImageEntity,
          videoDetail: dataState[2].data as MovieDetailVideoEntity,
        ),
      );
    }
    if (dataState is DataFailed) {
      emit(RemoteMovieDetailError(dataState[0].error as DioException));
    }
  }
}
