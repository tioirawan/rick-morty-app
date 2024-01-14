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

      await getCharacters();
    }

    return;
  }

  Future<void> getCharacters() async {
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
      );
    }

    try {
      final response = await _repository.getCharacters(nextPage);

      state = CharactersLoaded(
        characters: prevState.characters + response.results,
        maxPage: response.info.pages,
        currentPage: nextPage,
      );
    } catch (_) {
      state = CharactersError(
        message: 'Something went wrong!',
        characters: prevState.characters,
        maxPage: prevState.maxPage,
        currentPage: prevState.currentPage,
      );
    }
  }
}
