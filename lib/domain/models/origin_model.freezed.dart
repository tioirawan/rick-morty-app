// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'origin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OriginModel _$OriginModelFromJson(Map<String, dynamic> json) {
  return _OriginModel.fromJson(json);
}

/// @nodoc
mixin _$OriginModel {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OriginModelCopyWith<OriginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OriginModelCopyWith<$Res> {
  factory $OriginModelCopyWith(
          OriginModel value, $Res Function(OriginModel) then) =
      _$OriginModelCopyWithImpl<$Res, OriginModel>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$OriginModelCopyWithImpl<$Res, $Val extends OriginModel>
    implements $OriginModelCopyWith<$Res> {
  _$OriginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OriginModelImplCopyWith<$Res>
    implements $OriginModelCopyWith<$Res> {
  factory _$$OriginModelImplCopyWith(
          _$OriginModelImpl value, $Res Function(_$OriginModelImpl) then) =
      __$$OriginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$OriginModelImplCopyWithImpl<$Res>
    extends _$OriginModelCopyWithImpl<$Res, _$OriginModelImpl>
    implements _$$OriginModelImplCopyWith<$Res> {
  __$$OriginModelImplCopyWithImpl(
      _$OriginModelImpl _value, $Res Function(_$OriginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$OriginModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OriginModelImpl implements _OriginModel {
  _$OriginModelImpl({this.name, this.url});

  factory _$OriginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OriginModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString() {
    return 'OriginModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OriginModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OriginModelImplCopyWith<_$OriginModelImpl> get copyWith =>
      __$$OriginModelImplCopyWithImpl<_$OriginModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OriginModelImplToJson(
      this,
    );
  }
}

abstract class _OriginModel implements OriginModel {
  factory _OriginModel({final String? name, final String? url}) =
      _$OriginModelImpl;

  factory _OriginModel.fromJson(Map<String, dynamic> json) =
      _$OriginModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$OriginModelImplCopyWith<_$OriginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
