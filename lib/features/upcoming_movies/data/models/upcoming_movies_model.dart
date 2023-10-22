// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_db/features/upcoming_movies/domain/entities/upcoming_movies_entity.dart';
import 'package:floor/floor.dart';

class UpcomingMoviesModel extends UpcomingMoviesEntity {
  UpcomingMoviesModel({
    Dates? dates,
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) : super(
          dates: dates,
          results: results,
          page: page,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  UpcomingMoviesModel.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Dates extends DatesEntity {
  Dates({
    String? maximum,
    String? minimum,
  }) : super(
          maximum: maximum,
          minimum: minimum,
        );

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}

@Entity(tableName: 'upcoming_movies_results', primaryKeys: ['id'])
class Results extends ResultsEntity {
  Results({
    bool? adult,
    String? backdropPath,
    // List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          // genreIds: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    // genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = double.parse(json['vote_average'].toString());
    voteCount = json['vote_count'];
  }
  Results.fromEntity(ResultsEntity resultsEntity) {
    adult = resultsEntity.adult;
    backdropPath = resultsEntity.backdropPath;
    // genreIds = resultsEntity.genre_ids'].cast<int>;
    id = resultsEntity.id;
    originalLanguage = resultsEntity.originalLanguage;
    originalTitle = resultsEntity.originalTitle;
    overview = resultsEntity.overview;
    popularity = resultsEntity.popularity;
    posterPath = resultsEntity.posterPath;
    releaseDate = resultsEntity.releaseDate;
    title = resultsEntity.title;
    video = resultsEntity.video;
    voteAverage = double.parse(resultsEntity.voteAverage.toString());
    voteCount = resultsEntity.voteCount;
  }
}
