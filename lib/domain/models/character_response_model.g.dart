// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterResponseModelImpl _$$CharacterResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterResponseModelImpl(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CharacterResponseModelImplToJson(
        _$CharacterResponseModelImpl instance) =>
    <String, dynamic>{
      'info': instance.info.toJson(),
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
