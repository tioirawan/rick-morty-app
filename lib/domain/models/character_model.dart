import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/enums.dart';
import 'origin_model.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

final mockCharacter = CharacterModel.fromJson(
  {
    'id': 2,
    'name': 'Morty Smith',
    'status': 'Alive',
    'species': 'Human',
    'type': '',
    'gender': 'Male',
    'origin': {
      'name': 'Earth',
      'url': 'https://rickandmortyapi.com/api/location/1'
    },
    'location': {
      'name': 'Earth',
      'url': 'https://rickandmortyapi.com/api/location/20'
    },
    'image': 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
    'episode': [
      'https://rickandmortyapi.com/api/episode/1',
      'https://rickandmortyapi.com/api/episode/2',
      // ...
    ],
    'url': 'https://rickandmortyapi.com/api/character/2',
    'created': '2017-11-04T18:50:21.651Z'
  },
);

@freezed
class CharacterModel with _$CharacterModel {
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
}
