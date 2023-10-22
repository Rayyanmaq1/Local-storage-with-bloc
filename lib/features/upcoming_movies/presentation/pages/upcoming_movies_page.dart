import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/config/theme/app_colors.dart';
import 'package:movie_db/core/widgets/error_handler_widget.dart';
import 'package:movie_db/features/upcoming_movies/presentation/bloc/local/local_upcoming_movies_bloc.dart';
import 'package:movie_db/features/upcoming_movies/presentation/bloc/remote/remote_upcoming_movies_bloc.dart'
    hide GetUpcomingMovies;
import 'package:movie_db/features/upcoming_movies/presentation/bloc/remote/remote_upcoming_movies_state.dart';
import 'package:movie_db/features/upcoming_movies/presentation/widgets/movie_card.dart';
import 'package:movie_db/injection_container.dart';

class UpcomingMoviePage extends StatelessWidget {
  const UpcomingMoviePage({super.key});
  @override
  Widget build(BuildContext context) {
    final RemoteUpcomingMoviesBloc bloc = RemoteUpcomingMoviesBloc(sl());

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      title: const Text(
        'Watch',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: false,
      actions: [
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteUpcomingMoviesBloc, RemoteUpcomingMoviesState>(
      builder: ((context, state) {
        if (state is RemoteUpcomingMoviesLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is RemoteUpcomingMoviesError) {
          return BlocBuilder<LocalUpcomingMoviesBloc, LocalUpcomingMoviesState>(
            builder: ((context, state) {
              if (state is LocalUpcomingMoviesInitial) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }

              if (state is LocalUpcomingMoviesDone) {
                if (state.resultsEntity!.isEmpty) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<LocalUpcomingMoviesBloc>(context)
                          .add(const GetLocalUpcomingMovies());
                    },
                    child: ErrorHandlerWidget(
                      title: 'No Data Available.',
                      description:
                          'If network is unavailable then it would have loaded local saved data but currently no local data available.',
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.resultsEntity!.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.resultsEntity!.length) {
                      return Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: const Center(
                              child: CircularProgressIndicator.adaptive()));
                    }

                    return MovieCard(
                      movie: state.resultsEntity![index],
                      onMoviePressed: (article) =>
                          _onMoviePressed(context, article),
                    );
                  },
                );
              }
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<LocalUpcomingMoviesBloc>(context)
                      .add(const GetLocalUpcomingMovies());
                },
                child: ErrorHandlerWidget(
                  title: 'Something went wrong',
                  description: 'We are really sorry sometimes went wrong',
                  color: Colors.grey.withOpacity(0.2),
                ),
              );
            }),
          );
        }
        if (state is RemoteUpcomingMoviesDone) {
          log(state.upcomingMovies!.results!.length.toString());

          return ListView.builder(
            itemCount: state.upcomingMovies!.results!.length + 1,
            itemBuilder: (context, index) {
              if (index == state.upcomingMovies!.results!.length) {
                context
                    .read<RemoteUpcomingMoviesBloc>()
                    .add(const LoadMoreUpcomingMovies());
                return Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: const Center(
                        child: CircularProgressIndicator.adaptive()));
              }
              BlocProvider.of<LocalUpcomingMoviesBloc>(context).add(
                  SaveUpcomingMovies(state.upcomingMovies!.results![index]));
              return MovieCard(
                movie: state.upcomingMovies!.results![index],
                onMoviePressed: (article) => _onMoviePressed(context, article),
              );
            },
          );
        }
        return const SizedBox();
      }),
    );
  }

  void _onMoviePressed(BuildContext context, int id) {
    Navigator.pushNamed(context, '/movieDetail', arguments: id);
  }
}
