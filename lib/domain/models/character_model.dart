import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/enums.dart';
import 'origin_model.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const CharacterModel._();

  factory CharacterModel({
    int? id,
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
    String? created,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toRow() {
    final json = toJson();

    json['origin'] = jsonEncode(json['origin']);
    json['location'] = jsonEncode(json['location']);
    json['episode'] = jsonEncode(json['episode']);

    return json;
  }

  factory CharacterModel.fromRow(Map<String, dynamic> row) {
    final json = row.map((key, value) {
      if (key == 'origin' || key == 'location' || key == 'episode') {
        return MapEntry(key, jsonDecode(value));
      }

      return MapEntry(key, value);
    });

    return CharacterModel.fromJson(json);
  }
}
