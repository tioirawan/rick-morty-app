import '../../../domain/models/character_model.dart';

sealed class CharactersState {
  final List<CharacterModel> characters;
  final int maxPage;
  final int currentPage;
  final String? name;

  const CharactersState({
    required this.characters,
    required this.maxPage,
    required this.currentPage,
    this.name,
  });
}

class CharactersInitial extends CharactersState {
  const CharactersInitial()
      : super(
          characters: const [],
          maxPage: 1,
          currentPage: 0,
        );
}

class CharactersLoading extends CharactersState {
  const CharactersLoading({
    required super.characters,
    required super.maxPage,
    required super.currentPage,
    super.name,
  });
}

class CharactersLoaded extends CharactersState {
  const CharactersLoaded({
    required super.characters,
    required super.maxPage,
    required super.currentPage,
    super.name,
  });
}

class CharactersError extends CharactersState {
  final String message;

  const CharactersError({
    required this.message,
    required super.characters,
    required super.maxPage,
    required super.currentPage,
    super.name,
  });
}
