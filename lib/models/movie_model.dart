import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    // ignore: non_constant_identifier_names
    required String Title,
    // ignore: non_constant_identifier_names
    required String Type,
    // ignore: non_constant_identifier_names
    required String Year,
    // ignore: non_constant_identifier_names
    required String Poster,
    required String imdbID,
    String? imdbRating,
    String? Plot,
  }) = _Movie;

  factory Movie.fromJson(dynamic json) => _$MovieFromJson(json);
}
