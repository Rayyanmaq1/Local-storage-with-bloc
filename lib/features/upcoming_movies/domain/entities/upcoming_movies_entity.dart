// ignore_for_file: must_be_immutable

// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

class UpcomingMoviesEntity extends Equatable {
  DatesEntity? dates;
  int? page;
  List<ResultsEntity>? results;
  int? totalPages;
  int? totalResults;

  UpcomingMoviesEntity(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  @override
  List<Object?> get props => [
        dates,
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class DatesEntity extends Equatable {
  String? maximum;
  String? minimum;

  DatesEntity({this.maximum, this.minimum});

  @override
  List<Object?> get props => [
        maximum,
        minimum,
      ];
}

class ResultsEntity extends Equatable {
  bool? adult;
  String? backdropPath;
  // List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  ResultsEntity(
      {this.adult,
      this.backdropPath,
      // this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        // genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
