import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/common/enums.dart';
import 'package:rick_and_morty_app/domain/models/character_model.dart';

void main() {
  test('should parse json correctly', () {
    final json = {
      'id': 1,
      'name': 'Rick Sanchez',
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
      'image': 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
      'episode': [
        'https://rickandmortyapi.com/api/episode/1',
        'https://rickandmortyapi.com/api/episode/2',
      ],
      'url': 'https://rickandmortyapi.com/api/character/1',
      'created': '2017-11-04T18:48:46.250Z'
    };

    final character = CharacterModel.fromJson(json);

    expect(character.id, 1);
    expect(character.name, 'Rick Sanchez');
    expect(character.status, Status.alive);
    expect(character.species, 'Human');
    expect(character.type, '');
    expect(character.gender, Gender.male);
    expect(character.origin?.name, 'Earth');
    expect(character.origin?.url, 'https://rickandmortyapi.com/api/location/1');
    expect(character.location?.name, 'Earth');
    expect(
        character.location?.url, 'https://rickandmortyapi.com/api/location/20');
    expect(character.image,
        'https://rickandmortyapi.com/api/character/avatar/1.jpeg');
    expect(character.episode?.length, 2);
    expect(
        character.episode?.first, 'https://rickandmortyapi.com/api/episode/1');
    expect(
        character.episode?.last, 'https://rickandmortyapi.com/api/episode/2');
    expect(character.url, 'https://rickandmortyapi.com/api/character/1');
    expect(character.created, '2017-11-04T18:48:46.250Z');
  });
}
