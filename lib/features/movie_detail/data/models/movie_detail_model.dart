// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';

@immutable
class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel(
      {bool? adult,
      String? backdropPath,
      String? belongsToCollection,
      int? budget,
      List<Genres>? genres,
      String? homepage,
      int? id,
      String? imdbId,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      List<ProductionCompanies>? productionCompanies,
      List<ProductionCountries>? productionCountries,
      String? releaseDate,
      int? revenue,
      int? runtime,
      List<SpokenLanguages>? spokenLanguages,
      String? status,
      String? tagline,
      String? title,
      bool? video,
      double? voteAverage,
      int? voteCount})
      : super(
          adult: adult,
          backdropPath: backdropPath,
          belongsToCollection: belongsToCollection,
          budget: budget,
          genres: genres,
          homepage: homepage,
          id: id,
          imdbId: imdbId,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          spokenLanguages: spokenLanguages,
          status: status,
          tagline: tagline,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'].toString();
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}

@immutable
class Genres extends GenresEntity {
  Genres({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

@immutable
class ProductionCompanies extends ProductionCompaniesEntity {
  ProductionCompanies(
      {int? id, String? logoPath, String? name, String? originCountry})
      : super(
            id: id,
            logoPath: logoPath,
            name: name,
            originCountry: originCountry);

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
}

@immutable
class ProductionCountries extends ProductionCountriesEntity {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name})
      : super(
          iso31661: iso31661,
          name: name,
        );

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
}

@immutable
class SpokenLanguages extends SpokenLanguagesEntity {
  SpokenLanguages({
    String? englishName,
    String? iso6391,
    String? name,
  }) : super(englishName: englishName, iso6391: iso6391, name: name);

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
}
