import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../domain/models/character_model.dart';
import '../../providers/characters/characters_provider.dart';
import '../../providers/characters/characters_state.dart';
import 'character_card.dart';

class CharactersList extends ConsumerStatefulWidget {
  const CharactersList({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

  @override
  ConsumerState<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends ConsumerState<CharactersList> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(charactersProvider.notifier).initialize(delay: 1.seconds);
      widget.scrollController?.addListener(_scrollListener);
    });
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController!.offset >=
            widget.scrollController!.position.maxScrollExtent &&
        !widget.scrollController!.position.outOfRange) {
      ref.read(charactersProvider.notifier).loadMoreCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(charactersProvider);

    return switch (state) {
      CharactersInitial() => SliverFillRemaining(child: _buildLoading(context)),
      CharactersLoading(characters: final characters) => MultiSliver(
          children: [
            if (characters.isNotEmpty) _buildList(characters),
            SliverToBoxAdapter(
              child: _buildLoading(context),
            ),
          ],
        ),
      CharactersLoaded(characters: final characters) => _buildList(characters),
      CharactersError(message: final message) => _buildEmptyList(message),
      _ => const SliverToBoxAdapter(),
    };
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.25),
        child: Lottie.asset(
          'assets/lottie/loading.json',
        ),
      ),
    );
  }

  Widget _buildList(List<CharacterModel> characters) {
    if (characters.isEmpty) {
      return _buildEmptyList();
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => CharacterCard(
          character: characters[index],
          imageHeroTag: 'home_character_card_$index',
          onPressed: () {
            Navigator.pushNamed(context, '/detail', arguments: {
              'character': characters[index],
              'imageHeroTag': 'home_character_card_$index',
            });
          },
        ),
        childCount: characters.length,
      ),
    );
  }

  Widget _buildEmptyList([
    String message = 'Shooting in the emptyness...',
  ]) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/empty.json',
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
