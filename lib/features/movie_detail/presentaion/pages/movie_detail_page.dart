// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/config/theme/app_colors.dart';
import 'package:movie_db/core/utils/text_style.dart';
import 'package:movie_db/core/widgets/cached_image_widget.dart';
import 'package:movie_db/core/widgets/error_handler_widget.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';
import 'package:movie_db/features/movie_detail/presentaion/bloc/bloc/movie_detail_bloc.dart';
import 'package:movie_db/features/movie_detail/presentaion/bloc/bloc/movie_detail_event.dart';
import 'package:movie_db/features/movie_detail/presentaion/bloc/bloc/movie_detail_state.dart';
import 'package:movie_db/injection_container.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:intl/intl.dart';
import 'package:animate_do/animate_do.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, this.id});
  final int? id;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final RemoteMovieDetailBloc bloc = RemoteMovieDetailBloc(sl());

  @override
  void initState() {
    super.initState();
    bloc.add(RemoteGetMovieDetailEvent(movieID: widget.id));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteMovieDetailBloc, RemoteGetMovieDetailState>(
      bloc: bloc,
      builder: ((context, state) {
        if (state is RemoteMovieDetailLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is RemoteMovieDetailError) {
          return ErrorHandlerWidget(
            title: 'Something went wrong',
            description: 'We are really sorry sometimes went wrong',
            color: Colors.grey.withOpacity(0.2),
          );
        }
        if (state is RemoteMovieDetailDone) {
          final size = MediaQuery.of(context).size;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: size.height * 0.6,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      child: Hero(
                        tag: state.imageDetail!.id.toString(),
                        child: PageView.builder(
                          itemCount: state.imageDetail!.posters!.length,
                          itemBuilder: (context, index) {
                            return CachedImageWidget(
                              imageUrl:
                                  'https://www.themoviedb.org/t/p/w440_and_h660_face/${state.imageDetail!.posters![index].filePath}',
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 20,
                      child: _backButton(context),
                    ),
                    _movieInfo(state, context, size),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.03,
                  horizontal: size.width * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Genres',
                      style: AppTextStyles.medium.copyWith(
                        color: kblackColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Wrap(
                      spacing: 6,
                      runSpacing: 8,
                      children: [
                        for (int i = 0;
                            i < state.movieDetail!.genres!.length;
                            i++) ...{
                          Container(
                            decoration: BoxDecoration(
                              color: genreList[
                                  i % state.movieDetail!.genres!.length],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 12,
                            ),
                            child: Text(
                              state.movieDetail!.genres![i].name.toString(),
                              style: AppTextStyles.semiBold.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        },
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: const Divider(
                        color: kLightGreyColor,
                      ),
                    ),
                    Text(
                      'Overview',
                      style: AppTextStyles.medium.copyWith(
                        color: kblackColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      '${state.movieDetail!.overview}',
                      style: AppTextStyles.normal.copyWith(
                        color: kGreyColor,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      }),
    );
  }

  Positioned _movieInfo(
      RemoteMovieDetailDone state, BuildContext context, Size size) {
    return Positioned(
      bottom: 40,
      child: Column(
        children: [
          Text(
            'In theaters ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(state.movieDetail!.releaseDate.toString()))}',
            style: AppTextStyles.medium.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 14,
          ),
          CupertinoButton(
            onPressed: () {
              _getTicketPagePressed(context, state.movieDetail!);
            },
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                color: kLightBlueColor,
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
              ),
              child: Center(
                child: Text(
                  'Get Tickets',
                  style: AppTextStyles.semiBold.copyWith(
                    fontSize: 14,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CupertinoButton(
            onPressed: () {
              List<String> videoIds = <String>[];
              for (var element in state.videoDetail!.results!) {
                videoIds.add(element.key!);
              }
              _onWatchTrailerPressed(context, videoIds);
            },
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kLightBlueColor,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    12.0,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/svg/play_icon.svg',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Watch Trailer',
                    style: AppTextStyles.semiBold.copyWith(
                      fontSize: 14,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CupertinoButton _backButton(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.pop(context);
      },
      minSize: 0,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
            color: kWhiteColor,
          ),
          Text(
            'Watch',
            style: AppTextStyles.medium.copyWith(
              fontSize: 16.0,
              color: kWhiteColor,
            ),
          )
        ],
      ),
    );
  }

  void _onWatchTrailerPressed(BuildContext context, List videoIds) {
    log(videoIds.toString());
    Navigator.pushNamed(context, '/watchTrailer', arguments: videoIds);
  }

  void _getTicketPagePressed(BuildContext context, MovieDetailEntity videoIds) {
    log(videoIds.toString());
    Navigator.pushNamed(context, '/getTicketPage', arguments: videoIds);
  }
}
