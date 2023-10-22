// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_images_entity.dart';

class MovieDetailImagesModel extends MovieDetailImageEntity {
  MovieDetailImagesModel({
    List<ImageModel>? backdrops,
    int? id,
    List<ImageModel>? logos,
    List<ImageModel>? posters,
  }) : super(
          backdrops: backdrops,
          id: id,
          logos: logos,
          posters: posters,
        );

  MovieDetailImagesModel.fromJson(Map<String, dynamic> json) {
    if (json['backdrops'] != null) {
      backdrops = <ImageModel>[];
      json['backdrops'].forEach((v) {
        backdrops!.add(ImageModel.fromJson(v));
      });
    }
    id = json['id'];
    if (json['logos'] != null) {
      logos = <ImageModel>[];
      json['logos'].forEach((v) {
        logos!.add(ImageModel.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = <ImageModel>[];
      json['posters'].forEach((v) {
        posters!.add(ImageModel.fromJson(v));
      });
    }
  }
}

class ImageModel extends ImageEntity {
  ImageModel({
    double? aspectRatio,
    int? height,
    String? iso6391,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) : super(
          aspectRatio: aspectRatio,
          height: height,
          iso6391: iso6391,
          filePath: filePath,
          voteAverage: voteAverage,
          voteCount: voteCount,
          width: width,
        );

  ImageModel.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }
}
