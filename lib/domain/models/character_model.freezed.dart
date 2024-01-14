// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return _CharacterModel.fromJson(json);
}

/// @nodoc
mixin _$CharacterModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Status? get status => throw _privateConstructorUsedError;
  String? get species => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  OriginModel? get origin => throw _privateConstructorUsedError;
  OriginModel? get location => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<String>? get episode => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterModelCopyWith<CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterModelCopyWith<$Res> {
  factory $CharacterModelCopyWith(
          CharacterModel value, $Res Function(CharacterModel) then) =
      _$CharacterModelCopyWithImpl<$Res, CharacterModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      Status? status,
      String? species,
      String? type,
      Gender? gender,
      OriginModel? origin,
      OriginModel? location,
      String? image,
      List<String>? episode,
      String? url,
      String? created});

  $OriginModelCopyWith<$Res>? get origin;
  $OriginModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$CharacterModelCopyWithImpl<$Res, $Val extends CharacterModel>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? origin = freezed,
    Object? location = freezed,
    Object? image = freezed,
    Object? episode = freezed,
    Object? url = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as OriginModel?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as OriginModel?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: freezed == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OriginModelCopyWith<$Res>? get origin {
    if (_value.origin == null) {
      return null;
    }

    return $OriginModelCopyWith<$Res>(_value.origin!, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OriginModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $OriginModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterModelImplCopyWith<$Res>
    implements $CharacterModelCopyWith<$Res> {
  factory _$$CharacterModelImplCopyWith(_$CharacterModelImpl value,
          $Res Function(_$CharacterModelImpl) then) =
      __$$CharacterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      Status? status,
      String? species,
      String? type,
      Gender? gender,
      OriginModel? origin,
      OriginModel? location,
      String? image,
      List<String>? episode,
      String? url,
      String? created});

  @override
  $OriginModelCopyWith<$Res>? get origin;
  @override
  $OriginModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$$CharacterModelImplCopyWithImpl<$Res>
    extends _$CharacterModelCopyWithImpl<$Res, _$CharacterModelImpl>
    implements _$$CharacterModelImplCopyWith<$Res> {
  __$$CharacterModelImplCopyWithImpl(
      _$CharacterModelImpl _value, $Res Function(_$CharacterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? origin = freezed,
    Object? location = freezed,
    Object? image = freezed,
    Object? episode = freezed,
    Object? url = freezed,
    Object? created = freezed,
  }) {
    return _then(_$CharacterModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as OriginModel?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as OriginModel?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: freezed == episode
          ? _value._episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterModelImpl extends _CharacterModel {
  _$CharacterModelImpl(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      final List<String>? episode,
      this.url,
      this.created})
      : _episode = episode,
        super._();

  factory _$CharacterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final Status? status;
  @override
  final String? species;
  @override
  final String? type;
  @override
  final Gender? gender;
  @override
  final OriginModel? origin;
  @override
  final OriginModel? location;
  @override
  final String? image;
  final List<String>? _episode;
  @override
  List<String>? get episode {
    final value = _episode;
    if (value == null) return null;
    if (_episode is EqualUnmodifiableListView) return _episode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? url;
  @override
  final String? created;

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, url: $url, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._episode, _episode) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      const DeepCollectionEquality().hash(_episode),
      url,
      created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      __$$CharacterModelImplCopyWithImpl<_$CharacterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterModelImplToJson(
      this,
    );
  }
}

abstract class _CharacterModel extends CharacterModel {
  factory _CharacterModel(
      {final int? id,
      final String? name,
      final Status? status,
      final String? species,
      final String? type,
      final Gender? gender,
      final OriginModel? origin,
      final OriginModel? location,
      final String? image,
      final List<String>? episode,
      final String? url,
      final String? created}) = _$CharacterModelImpl;
  _CharacterModel._() : super._();

  factory _CharacterModel.fromJson(Map<String, dynamic> json) =
      _$CharacterModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  Status? get status;
  @override
  String? get species;
  @override
  String? get type;
  @override
  Gender? get gender;
  @override
  OriginModel? get origin;
  @override
  OriginModel? get location;
  @override
  String? get image;
  @override
  List<String>? get episode;
  @override
  String? get url;
  @override
  String? get created;
  @override
  @JsonKey(ignore: true)
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
