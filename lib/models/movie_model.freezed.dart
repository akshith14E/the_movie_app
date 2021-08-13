// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
class _$MovieTearOff {
  const _$MovieTearOff();

  _Movie call(
      {required String Title,
      required String Type,
      required String Year,
      required String Poster,
      required String imdbID,
      String? imdbRating,
      String? Plot}) {
    return _Movie(
      Title: Title,
      Type: Type,
      Year: Year,
      Poster: Poster,
      imdbID: imdbID,
      imdbRating: imdbRating,
      Plot: Plot,
    );
  }

  Movie fromJson(Map<String, Object> json) {
    return Movie.fromJson(json);
  }
}

/// @nodoc
const $Movie = _$MovieTearOff();

/// @nodoc
mixin _$Movie {
// ignore: non_constant_identifier_names
  String get Title =>
      throw _privateConstructorUsedError; // ignore: non_constant_identifier_names
  String get Type =>
      throw _privateConstructorUsedError; // ignore: non_constant_identifier_names
  String get Year =>
      throw _privateConstructorUsedError; // ignore: non_constant_identifier_names
  String get Poster => throw _privateConstructorUsedError;
  String get imdbID => throw _privateConstructorUsedError;
  String? get imdbRating => throw _privateConstructorUsedError;
  String? get Plot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res>;
  $Res call(
      {String Title,
      String Type,
      String Year,
      String Poster,
      String imdbID,
      String? imdbRating,
      String? Plot});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res> implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  final Movie _value;
  // ignore: unused_field
  final $Res Function(Movie) _then;

  @override
  $Res call({
    Object? Title = freezed,
    Object? Type = freezed,
    Object? Year = freezed,
    Object? Poster = freezed,
    Object? imdbID = freezed,
    Object? imdbRating = freezed,
    Object? Plot = freezed,
  }) {
    return _then(_value.copyWith(
      Title: Title == freezed
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String,
      Type: Type == freezed
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as String,
      Year: Year == freezed
          ? _value.Year
          : Year // ignore: cast_nullable_to_non_nullable
              as String,
      Poster: Poster == freezed
          ? _value.Poster
          : Poster // ignore: cast_nullable_to_non_nullable
              as String,
      imdbID: imdbID == freezed
          ? _value.imdbID
          : imdbID // ignore: cast_nullable_to_non_nullable
              as String,
      imdbRating: imdbRating == freezed
          ? _value.imdbRating
          : imdbRating // ignore: cast_nullable_to_non_nullable
              as String?,
      Plot: Plot == freezed
          ? _value.Plot
          : Plot // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$MovieCopyWith(_Movie value, $Res Function(_Movie) then) =
      __$MovieCopyWithImpl<$Res>;
  @override
  $Res call(
      {String Title,
      String Type,
      String Year,
      String Poster,
      String imdbID,
      String? imdbRating,
      String? Plot});
}

/// @nodoc
class __$MovieCopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res>
    implements _$MovieCopyWith<$Res> {
  __$MovieCopyWithImpl(_Movie _value, $Res Function(_Movie) _then)
      : super(_value, (v) => _then(v as _Movie));

  @override
  _Movie get _value => super._value as _Movie;

  @override
  $Res call({
    Object? Title = freezed,
    Object? Type = freezed,
    Object? Year = freezed,
    Object? Poster = freezed,
    Object? imdbID = freezed,
    Object? imdbRating = freezed,
    Object? Plot = freezed,
  }) {
    return _then(_Movie(
      Title: Title == freezed
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String,
      Type: Type == freezed
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as String,
      Year: Year == freezed
          ? _value.Year
          : Year // ignore: cast_nullable_to_non_nullable
              as String,
      Poster: Poster == freezed
          ? _value.Poster
          : Poster // ignore: cast_nullable_to_non_nullable
              as String,
      imdbID: imdbID == freezed
          ? _value.imdbID
          : imdbID // ignore: cast_nullable_to_non_nullable
              as String,
      imdbRating: imdbRating == freezed
          ? _value.imdbRating
          : imdbRating // ignore: cast_nullable_to_non_nullable
              as String?,
      Plot: Plot == freezed
          ? _value.Plot
          : Plot // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Movie with DiagnosticableTreeMixin implements _Movie {
  const _$_Movie(
      {required this.Title,
      required this.Type,
      required this.Year,
      required this.Poster,
      required this.imdbID,
      this.imdbRating,
      this.Plot});

  factory _$_Movie.fromJson(Map<String, dynamic> json) =>
      _$_$_MovieFromJson(json);

  @override // ignore: non_constant_identifier_names
  final String Title;
  @override // ignore: non_constant_identifier_names
  final String Type;
  @override // ignore: non_constant_identifier_names
  final String Year;
  @override // ignore: non_constant_identifier_names
  final String Poster;
  @override
  final String imdbID;
  @override
  final String? imdbRating;
  @override
  final String? Plot;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Movie(Title: $Title, Type: $Type, Year: $Year, Poster: $Poster, imdbID: $imdbID, imdbRating: $imdbRating, Plot: $Plot)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Movie'))
      ..add(DiagnosticsProperty('Title', Title))
      ..add(DiagnosticsProperty('Type', Type))
      ..add(DiagnosticsProperty('Year', Year))
      ..add(DiagnosticsProperty('Poster', Poster))
      ..add(DiagnosticsProperty('imdbID', imdbID))
      ..add(DiagnosticsProperty('imdbRating', imdbRating))
      ..add(DiagnosticsProperty('Plot', Plot));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Movie &&
            (identical(other.Title, Title) ||
                const DeepCollectionEquality().equals(other.Title, Title)) &&
            (identical(other.Type, Type) ||
                const DeepCollectionEquality().equals(other.Type, Type)) &&
            (identical(other.Year, Year) ||
                const DeepCollectionEquality().equals(other.Year, Year)) &&
            (identical(other.Poster, Poster) ||
                const DeepCollectionEquality().equals(other.Poster, Poster)) &&
            (identical(other.imdbID, imdbID) ||
                const DeepCollectionEquality().equals(other.imdbID, imdbID)) &&
            (identical(other.imdbRating, imdbRating) ||
                const DeepCollectionEquality()
                    .equals(other.imdbRating, imdbRating)) &&
            (identical(other.Plot, Plot) ||
                const DeepCollectionEquality().equals(other.Plot, Plot)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(Title) ^
      const DeepCollectionEquality().hash(Type) ^
      const DeepCollectionEquality().hash(Year) ^
      const DeepCollectionEquality().hash(Poster) ^
      const DeepCollectionEquality().hash(imdbID) ^
      const DeepCollectionEquality().hash(imdbRating) ^
      const DeepCollectionEquality().hash(Plot);

  @JsonKey(ignore: true)
  @override
  _$MovieCopyWith<_Movie> get copyWith =>
      __$MovieCopyWithImpl<_Movie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MovieToJson(this);
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {required String Title,
      required String Type,
      required String Year,
      required String Poster,
      required String imdbID,
      String? imdbRating,
      String? Plot}) = _$_Movie;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$_Movie.fromJson;

  @override // ignore: non_constant_identifier_names
  String get Title => throw _privateConstructorUsedError;
  @override // ignore: non_constant_identifier_names
  String get Type => throw _privateConstructorUsedError;
  @override // ignore: non_constant_identifier_names
  String get Year => throw _privateConstructorUsedError;
  @override // ignore: non_constant_identifier_names
  String get Poster => throw _privateConstructorUsedError;
  @override
  String get imdbID => throw _privateConstructorUsedError;
  @override
  String? get imdbRating => throw _privateConstructorUsedError;
  @override
  String? get Plot => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MovieCopyWith<_Movie> get copyWith => throw _privateConstructorUsedError;
}
