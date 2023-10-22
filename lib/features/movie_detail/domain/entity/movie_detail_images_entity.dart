// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class MovieDetailImageEntity extends Equatable {
  List<ImageEntity>? backdrops;
  int? id;
  List<ImageEntity>? logos;
  List<ImageEntity>? posters;

  MovieDetailImageEntity({this.backdrops, this.id, this.logos, this.posters});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (backdrops != null) {
      data['backdrops'] = backdrops!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    if (logos != null) {
      data['logos'] = logos!.map((v) => v.toJson()).toList();
    }
    if (posters != null) {
      data['posters'] = posters!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        backdrops,
        id,
        logos,
        posters,
      ];
}

class ImageEntity extends Equatable {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  ImageEntity(
      {this.aspectRatio,
      this.height,
      this.iso6391,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width});

  @override
  List<Object?> get props => [
        aspectRatio,
        height,
        iso6391,
        filePath,
        voteAverage,
        voteCount,
        width,
      ];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aspect_ratio'] = aspectRatio;
    data['height'] = height;
    data['iso_639_1'] = iso6391;
    data['file_path'] = filePath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['width'] = width;
    return data;
  }
}
