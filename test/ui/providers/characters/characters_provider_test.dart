import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irawan/domain/models/character_response_model.dart';
import 'package:irawan/domain/repositories/characters_repository.dart';
import 'package:irawan/ui/providers/characters/characters_provider.dart';
import 'package:irawan/ui/providers/characters/characters_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'characters_provider_test.mocks.dart';

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

@GenerateNiceMocks([
  MockSpec<CharactersRepository>(),
])
void main() {
  late CharactersRepository repository;
  late ProviderContainer container;

  setUp(() {
    repository = MockCharactersRepository();
    container = ProviderContainer(
      overrides: [
        charactersRepositoryProvider.overrideWithValue(repository),
      ],
    );
  });

  tearDown(() => container.dispose());

  test('should able to initialize characters when .initialize() is called',
      () async {
    final characters = jsonDecode(
      await File('test/__data/characters_page_1.json').readAsString(),
    );

    expect(container.read(charactersRepositoryProvider), repository);

    final listener = Listener();

    container.listen(
      charactersProvider,
      listener.call,
      fireImmediately: true,
    );

    verify(listener.call(null, isA<CharactersInitial>())).called(1);
    verifyNoMoreInteractions(listener);

    when(repository.getCharacters(1)).thenAnswer(
      (_) async => CharacterResponseModel.fromJson(characters),
    );

    await container.read(charactersProvider.notifier).initialize();

    // first initialize should not set the state to loading, because it's
    // already loading
    verifyNever(
      listener.call(isA<CharactersInitial>(), isA<CharactersLoading>()),
    );
    verify(listener.call(isA<CharactersInitial>(), isA<CharactersLoaded>()))
        .called(1);
  });

  test(
      'should able to load more characters when .loadMoreCharacters() is called',
      () async {
    final charactersPage1 = CharacterResponseModel.fromJson(jsonDecode(
      await File('test/__data/characters_page_1.json').readAsString(),
    ));
    final charactersPage2 = CharacterResponseModel.fromJson(jsonDecode(
      await File('test/__data/characters_page_2.json').readAsString(),
    ));

    expect(container.read(charactersRepositoryProvider), repository);

    final listener = Listener();

    container.listen(
      charactersProvider,
      listener.call,
      fireImmediately: true,
    );

    verify(listener.call(null, isA<CharactersInitial>())).called(1);
    verifyNoMoreInteractions(listener);

    when(repository.getCharacters(1)).thenAnswer(
      (_) async => charactersPage1,
    );

    await container.read(charactersProvider.notifier).initialize();

    verifyNever(
      listener.call(isA<CharactersInitial>(), isA<CharactersLoading>()),
    );
    verify(listener.call(isA<CharactersInitial>(), isA<CharactersLoaded>()))
        .called(1);

    when(repository.getCharacters(2)).thenAnswer(
      (_) async => charactersPage2,
    );

    await container.read(charactersProvider.notifier).loadMoreCharacters();

    verify(listener.call(isA<CharactersLoaded>(), isA<CharactersLoading>()))
        .called(1);
    verify(listener.call(isA<CharactersLoading>(), isA<CharactersLoaded>()))
        .called(1);

    final state = container.read(charactersProvider);

    expect(
      state.characters.length,
      charactersPage1.results.length + charactersPage2.results.length,
    );
    expect(state.currentPage, 2);
    expect(state.maxPage, charactersPage2.info.pages);
  });

  test('should search characters when .search() is called', () async {
    final charactersPage1 = CharacterResponseModel.fromJson(jsonDecode(
      await File('test/__data/characters_page_1.json').readAsString(),
    ));
    final charactersPage2 = CharacterResponseModel.fromJson(jsonDecode(
      await File('test/__data/characters_page_2.json').readAsString(),
    ));

    expect(container.read(charactersRepositoryProvider), repository);

    final listener = Listener();

    container.listen(
      charactersProvider,
      listener.call,
      fireImmediately: true,
    );

    verify(listener.call(null, isA<CharactersInitial>())).called(1);
    verifyNoMoreInteractions(listener);

    when(repository.getCharacters(1)).thenAnswer(
      (_) async => charactersPage1,
    );

    await container.read(charactersProvider.notifier).initialize();

    verifyNever(
      listener.call(isA<CharactersInitial>(), isA<CharactersLoading>()),
    );
    verify(listener.call(isA<CharactersInitial>(), isA<CharactersLoaded>()))
        .called(1);

    when(repository.getCharacters(1, name: 'rick')).thenAnswer(
      (_) async => charactersPage2,
    );

    await container.read(charactersProvider.notifier).searchCharacters('rick');

    verify(listener.call(isA<CharactersLoaded>(), isA<CharactersLoading>()))
        .called(1);
    verify(listener.call(isA<CharactersLoading>(), isA<CharactersLoaded>()))
        .called(1);

    final state = container.read(charactersProvider);

    expect(
      state.characters.length,
      charactersPage2.results.length,
    );
    expect(state.currentPage, 1);
    expect(state.maxPage, charactersPage2.info.pages);
  });
}
