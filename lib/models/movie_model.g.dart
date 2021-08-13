// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$_$_MovieFromJson(Map<String, dynamic> json) {
  return _$_Movie(
    Title: json['Title'] as String,
    Type: json['Type'] as String,
    Year: json['Year'] as String,
    Poster: json['Poster'] as String,
    imdbID: json['imdbID'] as String,
    imdbRating: json['imdbRating'] as String?,
    Plot: json['Plot'] as String?,
  );
}

Map<String, dynamic> _$_$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'Title': instance.Title,
      'Type': instance.Type,
      'Year': instance.Year,
      'Poster': instance.Poster,
      'imdbID': instance.imdbID,
      'imdbRating': instance.imdbRating,
      'Plot': instance.Plot,
    };
