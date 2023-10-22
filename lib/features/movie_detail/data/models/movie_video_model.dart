// ignore_for_file: must_be_immutable

import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_videos_entity.dart';

class MovieDetailVideoModel extends MovieDetailVideoEntity {
  MovieDetailVideoModel({
    int? id,
    List<ResultsModel>? results,
  }) : super(id: id, results: results);

  MovieDetailVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <ResultsModel>[];
      json['results'].forEach((v) {
        results!.add(ResultsModel.fromJson(v));
      });
    }
  }
}

class ResultsModel extends ResultsEntity {
  ResultsModel({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    String? publishedAt,
    String? id,
  }) : super();

  ResultsModel.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }
}
