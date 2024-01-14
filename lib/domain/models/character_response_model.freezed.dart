// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterResponseModel _$CharacterResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CharacterResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CharacterResponseModel {
  InfoModel get info => throw _privateConstructorUsedError;
  List<CharacterModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterResponseModelCopyWith<CharacterResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterResponseModelCopyWith<$Res> {
  factory $CharacterResponseModelCopyWith(CharacterResponseModel value,
          $Res Function(CharacterResponseModel) then) =
      _$CharacterResponseModelCopyWithImpl<$Res, CharacterResponseModel>;
  @useResult
  $Res call({InfoModel info, List<CharacterModel> results});

  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$CharacterResponseModelCopyWithImpl<$Res,
        $Val extends CharacterResponseModel>
    implements $CharacterResponseModelCopyWith<$Res> {
  _$CharacterResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InfoModelCopyWith<$Res> get info {
    return $InfoModelCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterResponseModelImplCopyWith<$Res>
    implements $CharacterResponseModelCopyWith<$Res> {
  factory _$$CharacterResponseModelImplCopyWith(
          _$CharacterResponseModelImpl value,
          $Res Function(_$CharacterResponseModelImpl) then) =
      __$$CharacterResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoModel info, List<CharacterModel> results});

  @override
  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$CharacterResponseModelImplCopyWithImpl<$Res>
    extends _$CharacterResponseModelCopyWithImpl<$Res,
        _$CharacterResponseModelImpl>
    implements _$$CharacterResponseModelImplCopyWith<$Res> {
  __$$CharacterResponseModelImplCopyWithImpl(
      _$CharacterResponseModelImpl _value,
      $Res Function(_$CharacterResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$CharacterResponseModelImpl(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterResponseModelImpl implements _CharacterResponseModel {
  _$CharacterResponseModelImpl(
      {required this.info, required final List<CharacterModel> results})
      : _results = results;

  factory _$CharacterResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterResponseModelImplFromJson(json);

  @override
  final InfoModel info;
  final List<CharacterModel> _results;
  @override
  List<CharacterModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'CharacterResponseModel(info: $info, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterResponseModelImpl &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterResponseModelImplCopyWith<_$CharacterResponseModelImpl>
      get copyWith => __$$CharacterResponseModelImplCopyWithImpl<
          _$CharacterResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CharacterResponseModel implements CharacterResponseModel {
  factory _CharacterResponseModel(
          {required final InfoModel info,
          required final List<CharacterModel> results}) =
      _$CharacterResponseModelImpl;

  factory _CharacterResponseModel.fromJson(Map<String, dynamic> json) =
      _$CharacterResponseModelImpl.fromJson;

  @override
  InfoModel get info;
  @override
  List<CharacterModel> get results;
  @override
  @JsonKey(ignore: true)
  _$$CharacterResponseModelImplCopyWith<_$CharacterResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
