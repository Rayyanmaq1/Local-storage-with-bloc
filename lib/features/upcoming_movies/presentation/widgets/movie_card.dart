import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/config/theme/app_colors.dart';
import 'package:movie_db/core/utils/text_style.dart';
import 'package:movie_db/core/widgets/cached_image_widget.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.onMoviePressed,
  });
  final ResultsEntity movie;
  final Function onMoviePressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        onPressed: () => onMoviePressed(movie.id!),
        child: Container(
          height: 220,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Hero(
                    tag: movie.id.toString(),
                    child: CachedImageWidget(
                      imageUrl:
                          'https://www.themoviedb.org/t/p/w440_and_h660_face/${movie.posterPath}',
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 20),
                    child: Text(
                      movie.title!,
                      style: AppTextStyles.medium.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
