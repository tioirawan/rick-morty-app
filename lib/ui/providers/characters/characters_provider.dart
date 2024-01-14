import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/repositories/characters_repository.dart';
import 'characters_state.dart';

part 'characters_provider.g.dart';

@Riverpod(keepAlive: true)
class Characters extends _$Characters {
  CharactersRepository get _repository =>
      ref.read(charactersRepositoryProvider);

  @override
  CharactersState build() {
    return const CharactersInitial();
  }

  Future<void> initialize({Duration? delay}) async {
    if (state is CharactersInitial) {
      if (delay != null) {
        await Future.delayed(delay);
      }

      await loadMoreCharacters();
    }

    return;
  }

  Future<void> loadMoreCharacters() async {
    final nextPage = state.currentPage + 1;

    if (state is CharactersLoading || nextPage > state.maxPage) {
      return;
    }

    final prevState = state;

    if (state is CharactersLoaded) {
      state = CharactersLoading(
        characters: prevState.characters,
        maxPage: prevState.maxPage,
        currentPage: prevState.currentPage,
        name: prevState.name,
      );
    }

    try {
      final response = await _repository.getCharacters(
        nextPage,
        name: state.name,
      );

      state = CharactersLoaded(
        characters: prevState.characters + response.results,
        maxPage: response.info.pages,
        currentPage: nextPage,
        name: prevState.name,
      );
    } catch (_) {
      state = CharactersError(
        message: 'Something went wrong!',
        characters: prevState.characters,
        maxPage: prevState.maxPage,
        currentPage: prevState.currentPage,
        name: prevState.name,
      );
    }
  }

  Future<void> searchCharacters(String? name) async {
    final prevState = state;

    if (state.name == name) {
      return;
    }

    state = CharactersLoading(
      characters: [],
      maxPage: 1,
      currentPage: 0,
      name: name,
    );

    try {
      final response = await _repository.getCharacters(
        1,
        name: name,
      );

      state = CharactersLoaded(
        characters: response.results,
        maxPage: response.info.pages,
        currentPage: 1,
        name: name,
      );
    } catch (_) {
      state = CharactersError(
        message: 'Something went wrong!',
        characters: prevState.characters,
        maxPage: prevState.maxPage,
        currentPage: prevState.currentPage,
        name: name,
      );
    }
  }
}
